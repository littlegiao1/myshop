package com.sssg.service;

import com.sssg.po.User;


public interface UserService {
    public User findUserById(int id);

    public User findUser(String user_code, String user_password);

    public int updateUser(User user);

    public int updatePassword(User user);

    public int createUser(User user);

    Boolean validateUserCode(String user_code);

    public int updateUserAddress(int user_id,String user_name, String user_phone, String user_address);

    public String queryUserQuestion(String user_code);

    public String queryUserAnswerByUserCode(String user_code);

    public int updateUserPswByUserCode(String user_Code, String user_password);
}
