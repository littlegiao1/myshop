package com.sssg.controller;

import javax.servlet.http.HttpSession;

import org.apache.tools.ant.types.CommandlineJava.SysProperties;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sssg.po.User;
import com.sssg.service.UserService;


@Controller
public class UserController {


    @Autowired
    private UserService userService;


    @RequestMapping("/createUser.action")
    @ResponseBody
    public String createUser(User user, Model model) {
        System.out.println(user);
        int result = userService.createUser(user);
        if (result > 0) {
            return "OK";
        } else {
            return "FAIL";
        }

    }

    @RequestMapping("/returnLogin.action")
    public String returnLogin(Model model) {
        return "footer";

    }

    @RequestMapping("/validateUserCode.action")
    @ResponseBody
    public String validateUserCode(String user_code) {
        Boolean result = userService.validateUserCode(user_code);
        if (result == true) {
            return "OK";
        } else {
            return "FAIL";
        }

    }


    @RequestMapping("/queryUserQuestion.action")
    @ResponseBody
    public String queryUserQuestion(String user_code) {
        String user_question = userService.queryUserQuestion(user_code);
        return user_question;
    }

    @RequestMapping("/queryUserAnswerByUserCode.action")
    @ResponseBody
    public String queryUserAnswerByUserCode(String user_code) {
        String user_answer = userService.queryUserAnswerByUserCode(user_code);
        return user_answer;
    }


    @RequestMapping(value = "/login.action", method = RequestMethod.POST)
    @ResponseBody
    public String login(String user_code, String user_password, HttpSession session) {
        System.out.println("ok");
        System.out.println(user_code);
        System.out.println(user_password);
        User user = userService.findUser(user_code, user_password);


        if (user != null) {
            if (user.getUser_level().equals("¹ÜÀíÔ±")) {
                session.setAttribute("user_session", user);
                return "admin";
            } else {
                session.setAttribute("user_session", user);
                return "OK";
            }

        }
        return "FAIL";

    }

    @RequestMapping("/updateUser.action")
    @ResponseBody
    public String updateUser(User user, HttpSession session) {
        int result = userService.updateUser(user);

        if (result > 0) {
            User user1 = (User) session.getAttribute("user_session");
            user1.setUser_password(user.getUser_password());
            user1.setUser_phone(user.getUser_phone());
            user1.setUser_code(user.getUser_code());
            session.setAttribute("user_session", user1);
            return "OK";
        } else {
            return "FAIL";
        }
    }

    @RequestMapping("/updateUserPswByUserCode.action")
    @ResponseBody
    public String updateUserPswByUserCode(String user_code,String user_password, HttpSession session) {
        System.out.println("ÕËºÅ£º"+user_code+"ÃÜÂë"+user_password);
        int result = userService.updateUserPswByUserCode(user_code,user_password);

        if (result > 0) {
            return "OK";
        } else {
            return "FAIL";
        }
    }

    @RequestMapping("/updateUserAddress.action")
    @ResponseBody
    public String updateUserAddress(int user_id, String user_name, String user_phone, String user_address, HttpSession session) {
        int result = userService.updateUserAddress(user_id, user_name, user_phone, user_address);

        if (result > 0) {
            User user1 = (User) session.getAttribute("user_session");
            user1.setUser_name(user_name);
            user1.setUser_phone(user_phone);
            user1.setUser_address(user_address);
            session.setAttribute("user_session", user1);
            return "OK";
        } else {
            return "FAIL";
        }
    }


    @RequestMapping("/findUserById.action")
    @ResponseBody
    public User findUserById(int id) {
        User user = userService.findUserById(id);
        return user;
    }


    @RequestMapping("/logout.action")
    @ResponseBody
    public String logout(HttpSession session) {
        User user = (User) session.getAttribute("user_session");
        System.out.println(user.getUser_name() + "ÍË³öµÇÂ¼");
        session.invalidate();
        return "OK";

    }


}
