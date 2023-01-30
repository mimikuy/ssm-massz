package cn.massz.controller;

import cn.massz.controller.util.R;
import cn.massz.model.Users;
import cn.massz.service.UserService;
import com.sun.org.apache.bcel.internal.generic.IF_ACMPEQ;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;


import javax.servlet.http.HttpSession;
import java.io.File;
import java.util.UUID;

@Controller
//@RequestMapping("/users")
public class UserController {

    @RequestMapping("/toHome")
    public String toHome(){
        return "home";
    }

    @RequestMapping("/toLogin")
    public String toLogin(){
        return "login";
    }

    @RequestMapping("/tojinba")
    public String tojinba(){
        return "jinba";
    }

    @RequestMapping("/toPosts")
    public String toPosts(){
        return "posts";
    }

    @RequestMapping("/toMyPage")
    public String toMyPage(){
        return "myPage";
    }

    @RequestMapping("/toRegister")
    public String toRegister(){
        return "register";
    }

    @Autowired
    private UserService userService;

    @GetMapping("/users")
    @ResponseBody
    public R findByName(Users users, HttpSession session) {

        Users user = userService.findByName(users);
        System.out.println(user);
        R r=new R();
        if(users == null){
            r.setCode(400);
            r.setMsg("用户名不存在！");
        }else{
            if(user.getPassword().equals(users.getPassword())){
                // 把用户信息放入session中
                session.setAttribute("userSession",user);
                r.setCode(200);
                r.setMsg("登录成功");
            }else{
                r.setCode(400);
                r.setMsg("密码错误");
            }
        }
        return r;
    }

    @RequestMapping("/tomy")
    public String tomy(){
        return "my";
    }

    @RequestMapping("/tomyinformation")
    public String tomyinformation(){
        return "myinformation";
    }


    @RequestMapping("tosetup")
    public String tosetup(){
        return "setup";
    }

    @PutMapping("/users")
    @ResponseBody
    public R upDateMI(Users users,HttpSession session) {
        System.out.println(users);

        Boolean dateMI = userService.upDateMI(users);
        System.out.println(dateMI);
        if (dateMI) {

            Users user = (Users)session.getAttribute("userSession");
            user.setNick_name(users.getNick_name());
            user.setGender(users.getGender());
            user.setSignature(users.getSignature());
            return new R(200, "更新成功");
        } else {
            return new R(500, "更新失败");
        }
    }

    @PostMapping("/uploadFile")
    @ResponseBody
    public R updateImg(@RequestParam("avatar") MultipartFile avatar,HttpSession session) {

        // 判断所上传文件是否存在
        if (!avatar.isEmpty()) {
            // 获取上传文件的原始名称
            String originalFilename = avatar.getOriginalFilename();
//            Integer.parseInt(String s)
            // 设置上传文件的保存地址目录
            //    String dirPath = request.getServletContext().getRealPath("/upload/");
            String dirPath = "D:/study/upload/"; // 上传到其它目录，文件不会随tomcat重启消失
            File filePath = new File(dirPath);
            // 如果保存文件的地址不存在，就先创建目录
            if (!filePath.exists()) {
                filePath.mkdirs();
            }
            // 使用UUID重新命名上传的文件名称(uuid_原始文件名称)
            String newFilename = UUID.randomUUID() +
                    "_" + originalFilename;
            try {
                // 使用MultipartFile接口的方法完成文件上传到指定位置
                avatar.transferTo(new File(dirPath + newFilename));
            } catch (Exception e) {
                e.printStackTrace();
            }
            Users users = (Users)session.getAttribute("userSession");
            users.setAvatar(newFilename);
            System.out.println(users);
            Boolean flag = userService.updateImg(users);
            System.out.println(flag);
            if (flag) {
                return new R(200, "头像更新成功", users);
            } else{
                return new R(500, "头像更新失败");
            }

        } else {
            return new R(500, "头像更新失败");
        }
    }

    @GetMapping("/userNameExist")
    @ResponseBody
    public R userNameExist(@RequestParam("userName") String user_name){
        System.out.println(user_name);
        Users users = userService.findUsersByUserName(user_name);
        R r = new R();
        if(users == null){
            r.setCode(500);
            r.setData(0);
        }else{
            r.setCode(200);
            r.setData(1);
        }
        return r;
    }

    // 用户注册
    @PostMapping("/register")
    @ResponseBody
    public R register(Users users){
        System.out.println(users);
        int result = userService.insertUsers(users);
        R r = new R();
        if(result>0){
            r.setCode(200);
        }else{
            r.setCode(400);
            r.setMsg("注册失败");
        }
        return r;
    }

    // 查询用户信息
    @GetMapping("findUserInfo")
    @ResponseBody
    public R findUserInfo(HttpSession session){
        Users users = (Users)session.getAttribute("userSession");

        Users usersInfo = userService.findUserInfo(users.getUser_id());
        R r = new R();
        if (usersInfo !=null ){
            r.setData(usersInfo);
            r.setCode(200);
        }
        return r;
    }

    // 查询个人用户信息
    @GetMapping("findUserInformation")
    @ResponseBody
    public R toMyPage(HttpSession session){
        Users users = (Users)session.getAttribute("userSession");

        Users userInformation = userService.findUserInformation(users.getUser_id());
        R r = new R();
        if (userInformation !=null ){
            session.setAttribute("userInformation",userInformation);
            r.setCode(200);
        }
        return r;
    }

    // 退出
    @RequestMapping("logout")
    public String logout(HttpSession session){
        // 销毁回话
        session.invalidate();
        // 重定向到登录页面
        return "redirect:/toLogin";
    }

}
