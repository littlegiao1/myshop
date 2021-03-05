package com.sssg.dao;

import org.apache.ibatis.annotations.Param;

import com.sssg.po.User;

public interface UserDao {
    public User findUser(@Param("user_code") String user_code, @Param("user_password") String user_password);

    public User findUserById(int id);

    public int updateUser(User user);

    public int updatePassword(User user);

    public int createUser(User user);

    public User selectUserByUserCode(String user_code);

    public int updateUserAddressByUserId(@Param("user_id")int user_id, @Param("user_name")String user_name, @Param("user_phone")String user_phone, @Param("user_address")String user_address);

    public String selectUserQuestionByUserCode(String user_code);

    public String selectUserAnswerByUserCode(String user_code);

    public int updateUserPasswordByUserCode(@Param("user_code") String user_code,@Param("user_password") String user_password);
}
