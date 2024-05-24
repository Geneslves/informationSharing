package com.ledao.service.impl;

import com.ledao.entity.User;
import com.ledao.mapper.AdmUserMapper;
import com.ledao.service.AdmUserService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

/**
 * 用户Service实现类
 *
 * @author
 * @company
 * @create
 */
@Service("admuserService")
public class AdmUserServiceImpl implements AdmUserService {

    @Resource
    private AdmUserMapper admUserMapper;

    @Override
    public List<User> list(Map<String, Object> map) {
        return admUserMapper.list(map);
    }

    @Override
    public Long getTotal(Map<String, Object> map) {
        return admUserMapper.getTotal(map);
    }

    @Override
    public Integer add(User user) {
        return admUserMapper.add(user);
    }

    @Override
    public Integer update(User user) {
        return admUserMapper.update(user);
    }

    @Override
    public Integer deleteById(Integer id) {
        return admUserMapper.deleteById(id);
    }

    @Override
    public User findByUserName(String userName) {
        return admUserMapper.findByUserName(userName);
    }

    @Override
    public User findById(Integer id) {
        return admUserMapper.findById(id);
    }

    @Override
    public User findByEmail(String email) {
        return admUserMapper.findByEmail(email);
    }

    @Override
    public List<User> findByName(String userName) {
        return admUserMapper.findByName(userName);
    }
}
