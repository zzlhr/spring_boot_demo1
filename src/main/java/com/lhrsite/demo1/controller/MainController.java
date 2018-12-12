package com.lhrsite.demo1.controller;


import com.lhrsite.demo1.entity.User;
import com.lhrsite.demo1.service.UserService;
import com.lhrsite.demo1.vo.UserVO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.List;

@Controller
@Slf4j
public class MainController {


    private final UserService userService;

    public MainController(UserService userService) {
        this.userService = userService;
    }

    @ResponseBody
    @RequestMapping("/hello.html")
    public String hello(Model model) {
        model.addAttribute("message", "Hello World");
        return "index";
    }

    @RequestMapping("/index.html")
    public String index(Model model) {
        model.addAttribute("message", "spring boot demo 01 Index Page");
        return "index";
    }

    @RequestMapping("/table.html")
    public String table(Model model) {

        List<UserVO> userVOList = new ArrayList<>();

        UserVO userVO1 = new UserVO();
        userVO1.setId(1);
        userVO1.setUserName("张三");
        userVO1.setNickName("阿三");
        userVO1.setSex(1);

        userVOList.add(userVO1);


        UserVO userVO2 = new UserVO();
        userVO2.setId(2);
        userVO2.setUserName("李四");
        userVO2.setNickName("阿四");
        userVO2.setSex(1);
        userVOList.add(userVO2);


        UserVO userVO3 = new UserVO();
        userVO3.setId(3);
        userVO3.setUserName("王五");
        userVO3.setNickName("阿五");
        userVO3.setSex(2);
        userVOList.add(userVO3);


        model.addAttribute("user", userVOList);
        return "table";
    }


    @GetMapping("/users.html")
    public String users(Model model) {
        List<User> users = userService.getUser();
        model.addAttribute("users", users);
        return "users";
    }


    @GetMapping("/add.html")
    public String add() {
        return "add";
    }


    @ResponseBody
    @PostMapping("/add.html")
    public String addUser(String userName, String password) {
        User user = new User();
        user.setUserName(userName);
        user.setPassword(password);
        userService.saveUser(user);
        return "<script>alert('添加成功！')</script>";
    }

    @ResponseBody
    @GetMapping("/deleteUser")
    public String deleteUser(Integer uid) {
        try {
            userService.delete(uid);
            return "<script>alert('删除成功！'); location.href='users.html'</script>";
        } catch (Exception e) {
            return "<script>alert('删除失败！'); location.href='users.html'</script>";
        }
    }

    @ResponseBody
    @PostMapping("/update.html")
    public String updateUser(Integer uid, String userName, String password) {
        log.info("【修改用户】uid={}, userName={}, password={}", uid, userName, password);
        try {
            User user = new User();
            user.setUid(uid);
            user.setUserName(userName);
            user.setPassword(password);
            userService.saveUser(user);
            return "<script>alert('修改用户成功！'); location.href='users.html'</script>";
        } catch (Exception e) {
            log.error("【保存用户错误】errMsg={}", e.getMessage());
            return "<script>alert('修改用户失败，请重试！');";
        }
    }
}
