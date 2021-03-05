package com.sssg.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sssg.dao.UserDao;
import com.sssg.po.User;
import com.sssg.service.UserService;


@Service("userServiceImpl")
public class UserServiceImpl implements UserService {
    @Autowired
    private UserDao userDao;

    public User findUser(String user_code, String user_password) {
        User user = userDao.findUser(user_code, user_password);
        return user;
    }

    public User findUserById(int id) {
        User user = userDao.findUserById(id);
        return user;
    }


    public int updateUser(User user) {
        int result = userDao.updateUser(user);
        return result;
    }

    public int updatePassword(User user) {
        int result = userDao.updatePassword(user);
        return result;
    }

    public int createUser(User user) {
        int result = userDao.createUser(user);
        return result;

    }

    public Boolean validateUserCode(String user_code) {
        User user = null;
        user = userDao.selectUserByUserCode(user_code);
        if (user != null) {
            return true;
        }
        return false;

    }

    public int updateUserAddress(int user_id,String user_name, String user_phone, String user_address) {
        int result = userDao.updateUserAddressByUserId(user_id,user_name,user_phone,user_address);

        return result;
    }

    public String queryUserQuestion(String user_code) {
        String user_question = userDao.selectUserQuestionByUserCode(user_code);
        return user_question;
    }

    public String queryUserAnswerByUserCode(String user_code) {
        return  userDao.selectUserAnswerByUserCode(user_code);
    }

    public int updateUserPswByUserCode(String user_Code, String user_password) {
        return userDao.updateUserPasswordByUserCode(user_Code,user_password);
    }
}