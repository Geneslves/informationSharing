package com.ledao.controller.admin;

import com.ledao.entity.PageBean;
import com.ledao.entity.User;
import com.ledao.service.AdmUserService;
import com.ledao.service.impl.AdmUserServiceImpl;
import com.ledao.util.StringUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

/**
 * 后台用户Controller层
 *
 * @author
 * @company
 * @create 2024-01-02 2:02
 */
@RestController
@RequestMapping("/admin/admuser")
public class AdmUserAdminController {

    @Resource
    private AdmUserService admUserService;
    @Autowired
    private AdmUserServiceImpl admuserService;

    /**
     * 下拉框模糊查询
     *
     * @param q
     * @return
     */
    @RequestMapping("/comboList")
    public List<User> comboList(String q) {
        if (q == null) {
            q = "";
        }
        String removeUserName = "admin";
        List<User> userList = admUserService.findByName(StringUtil.formatLike(q));
        Iterator iterator = userList.iterator();
        if (iterator.hasNext()) {
            User user = (User) iterator.next();
            if (removeUserName.equals(user.getUserName())) {
                iterator.remove();
            }
        }
        return userList;
    }

    /**
     * 根据条件分页条件查询用户
     *
     * @param user
     * @param page
     * @param rows
     * @return
     */
    @RequestMapping("/list")
    public Map<String, Object> list(User user, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "rows", required = false) Integer rows) {
        Map<String, Object> resultMap = new HashMap<>(16);
        Map<String, Object> map = new HashMap<>(16);
        PageBean pageBean = new PageBean(page, rows);
        map.put("start", pageBean.getStart());
        map.put("size", pageBean.getPageSize());
        map.put("userName", StringUtil.formatLike(user.getUserName()));
        map.put("email", StringUtil.formatLike(user.getEmail()));
        map.put("roleName", user.getRoleName());
        map.put("isOff", user.getIsOff());
        map.put("key", 1);
        List<User> userList = admuserService.list(map);
        for (User u : userList) {
            Integer resourceCount = admuserService.getResourceCountByUserId(u.getId());
            u.setResourceCount(resourceCount);
        }
        for (User user1 : userList) {
            user1.setPassword(user1.getPassword());
        }
        Long total = admuserService.getTotal(map);
        resultMap.put("rows", userList);
        resultMap.put("total", total);
        return resultMap;
    }

    /**
     * 添加或修改用户
     *
     * @param user
     * @return
     */
    @RequestMapping("/save")
    public Map<String, Object> save(User user) {
        Map<String, Object> resultMap = new HashMap<>(16);
        User user1 = admuserService.findByEmail(user.getEmail());
        //当id为空时,添加用户
        if (user.getId() == null) {
            //邮箱被注册
            if (user1 != null) {
                resultMap.put("success", false);
                resultMap.put("errorInfo", "该邮箱已被注册,请重新输入!!");
            } else {
                //密码和确认密码不一致
                if (!user.getPassword().equals(user.getPassword2())) {
                    resultMap.put("success", false);
                    resultMap.put("errorInfo", "密码和确认密码不一样,请重新输入!!");
                } else {
                    User user2 = admuserService.findByUserName(user.getUserName());
                    //用户名被注册
                    if (user2 != null) {
                        resultMap.put("success", false);
                        resultMap.put("errorInfo", "该用户名已被注册,请重新输入!!");
                    } else {
                        resultMap.put("success", true);
                        user.setPassword(user.getPassword());
                        admuserService.add(user);
                    }
                }
            }
        } else {
            //要修改的用户原来的信息
            User user3 = admuserService.findById(user.getId());
            //邮箱被注册并且修改后的邮箱和之前的邮箱不相同
            if (user1 != null && (!user.getEmail().equals(user3.getEmail()))) {
                resultMap.put("success", false);
                resultMap.put("errorInfo", "该邮箱已被注册,请重新输入!!");
            } else {
                //密码和确认密码不一致
                if (!user.getPassword().equals(user.getPassword2())) {
                    resultMap.put("success", false);
                    resultMap.put("errorInfo", "密码和确认密码不一样,请重新输入!!");
                } else {
                    resultMap.put("success", true);
                    user.setPassword(user.getPassword());
                    admUserService.update(user);
                }
            }
        }
        return resultMap;
    }

    /**
     * 根据id删除用户,可批量删除
     *
     * @param ids
     * @return
     */
    @RequestMapping("/delete")
    public Map<String, Object> delete(String ids) {
        Map<String, Object> resultMap = new HashMap<>(16);
        String[] idsStr = ids.split(",");
        for (int i = 0; i < idsStr.length; i++) {
            int id = Integer.parseInt(idsStr[i]);
            admuserService.deleteById(id);
        }
        resultMap.put("success", true);
        return resultMap;
    }

    /**
     * 修改账号状态(封禁或解封)
     *
     * @param id
     * @param isOff
     * @return
     */
    @RequestMapping("/modifyOff")
    public Map<String, Object> modifyOff(Integer id, Integer isOff) {
        Map<String, Object> resultMap = new HashMap<>(16);
        User user = admuserService.findById(id);
        user.setIsOff(isOff);
        admuserService.update(user);
        resultMap.put("success", true);
        return resultMap;
    }

    /**
     * 修改用户类型(普通用户或管理员)
     *
     * @param id
     * @param roleName
     * @return
     */
    @RequestMapping("/modifyRoleType")
    public Map<String, Object> modifyRoleType(Integer id, String roleName) {
        Map<String, Object> resultMap = new HashMap<>(16);
        User user = admuserService.findById(id);
        user.setRoleName(roleName);
        if (roleName.equals("普通用户")) {
            user.setIsVip(0);
        }else {
            user.setIsVip(1);
        }
        admuserService.update(user);
        resultMap.put("success", true);
        return resultMap;
    }

    /**
     * 给用户加或减积分
     *
     * @param id
     * @param status 1代表加积分,2代表减积分
     * @param points
     * @return
     */
    @RequestMapping("/addOrReducePoints")
    public Map<String, Object> addOrReducePoints(Integer id, Integer status, Integer points) {
        Map<String, Object> resultMap = new HashMap<>(16);
        User user = admuserService.findById(id);
        //加积分
        if (status == 1) {
            user.setPoints(user.getPoints() + points);
            resultMap.put("success", true);
        } else {
            //用户当前剩余积分大于要扣除的积分
            if (user.getPoints() >= points) {
                user.setPoints(user.getPoints() - points);
                resultMap.put("success", true);
            } else {
                resultMap.put("success", false);
                resultMap.put("errorInfo", "用户当前剩余积分少于要扣除的积分,不能扣除积分!");
            }
        }
        admuserService.update(user);
        return resultMap;
    }
}
