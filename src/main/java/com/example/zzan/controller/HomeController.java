package com.example.zzan.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.UUID;

import com.example.zzan.pack.DBUtill;

@Controller
public class HomeController {

    @RequestMapping("/")
    public String home(Model model) {
        model.addAttribute("message", "Welcome to Zzan!");
        return "index"; // index.jsp를 반환
    }

    // BBS 관련 매핑
    @GetMapping("/bbs/bbs")
    public String bbs() {
        return "bbs/bbs"; // bbs.jsp를 반환
    }

    @GetMapping("/bbs/deleteBBS")
    public String deleteBBS() {
        return "bbs/deleteBBS"; // deleteBBS.jsp를 반환
    }

    @GetMapping("/bbs/read")
    public String read() {
        return "bbs/read"; // read.jsp를 반환
    }

    @GetMapping("/bbs/update")
    public String update() {
        return "bbs/update"; // update.jsp를 반환
    }

    @GetMapping("/bbs/write")
    public String write() {
        return "bbs/write"; // write.jsp를 반환
    }

    @GetMapping("/bbs/writeProc")
    public String writeProc() {
        return "bbs/writeProc"; // writeProc.jsp를 반환
    }

    @GetMapping("/bbs/updateProc")
    public String updateProc() {
        return "bbs/updateProc"; // updateProc.jsp를 반환
    }

    // Cart 관련 매핑
    @GetMapping("/cart/shoppingBasket")
    public String shoppingBasket() {
        return "cart/shoppingBasket"; // shoppingBasket.jsp를 반환
    }

    @GetMapping("/cart/shoppingBasketConn")
    public String shoppingBasketConn() {
        return "cart/shoppingBasketConn"; // shoppingBasketConn.jsp를 반환
    }

    @GetMapping("/cart/shoppingBasketDelete")
    public String shoppingBasketDelete() {
        return "cart/shoppingBasketDelete"; // shoppingBasketDelete.jsp를 반환
    }

    // Header와 Footer 매핑
    @GetMapping("/footer")
    public String footer() {
        return "ind/footer"; // footer.jsp를 반환
    }

    @GetMapping("/header")
    public String header() {
        return "ind/header"; // header.jsp를 반환
    }

    // Member 관련 매핑
    @GetMapping("/member/Login")
    public String login() {
        return "member/Login"; // Login.jsp를 반환
    }

    @GetMapping("/member/join/member_join")
    public String memberJoin() {
        return "member/join/member_join"; // member/join/member_join.jsp를 반환
    }

    @GetMapping("/member/join/chk_agree")
    public String chkAgree() {
        return "member/join/chk_agree"; // member/join/chk_agree.jsp를 반환
    }

    @GetMapping("/member/join/Information_Agreement")
    public String informationAgreement() {
        return "member/join/Information_Agreement"; // member/join/Information_Agreement.jsp를 반환
    }

    @GetMapping("/member/join/memberJoin_Agreement")
    public String memberJoinAgreement() {
        return "member/join/memberJoin_Agreement"; // member/join/memberJoin_Agreement.jsp를 반환
    }

    @GetMapping("/member/join/joinProc")
    public String joinProc() {
        return "member/join/joinProc"; // member/join/joinProc.jsp를 반환
    }

    @GetMapping("/member/loginprocess")
    public String loginprocess() {
        return "member/loginprocess"; // loginprocess.jsp를 반환
    }

    @GetMapping("/member/LogoutProc")
    public String logout() {
        return "member/LogoutProc"; // LogoutProc.jsp를 반환
    }

    // Showcase 관련 매핑
    @GetMapping("/showcase/deleteFile")
    public String deleteFile() {
        return "showcase/deleteFile"; // deleteFile.jsp를 반환
    }

    @GetMapping("/showcase/productList")
    public String productList() {
        return "showcase/productList"; // productList.jsp를 반환
    }

    @GetMapping("/showcase/register")
    public String register() {
        return "showcase/register"; // register.jsp를 반환
    }

    // 추가된 Showcase 관련 매핑
    @GetMapping("/showcase/uploadResult")
    public String uploadResult() {
        return "showcase/uploadResult"; // uploadResult.jsp를 반환
    }

    // Admin 관련 매핑
    @GetMapping("/admin/adminLogin")
    public String adminLogin() {
        return "admin/adminLogin"; // adminLogin.jsp를 반환
    }

    @GetMapping("/admin/ad_LoginProc")
    public String adLoginProc() {
        return "admin/ad_LoginProc"; // ad_LoginProc.jsp를 반환
    }

    @GetMapping("/admin/adminPage")
    public String adminPage() {
        return "admin/adminPage"; // adminPage.jsp를 반환
    }

    // 파일 업로드 처리 매핑
    @PostMapping("/uploadFile")
    public String handleFileUpload(@RequestParam("image") MultipartFile file,
                                   @RequestParam("productName") String productName,
                                   @RequestParam("price") String price,
                                   @RequestParam("description") String description,
                                   @RequestParam("category") String category,
                                   Model model) {
        if (file.isEmpty()) {
            model.addAttribute("message", "업로드된 파일이 없습니다.");
            return "showcase/register";
        }

        String fileStorage = "/path/to/images/"; // 파일 저장 경로
        String upFileName = UUID.randomUUID().toString() + "_" + file.getOriginalFilename();
        File destFile = new File(fileStorage + upFileName);

        try {
            file.transferTo(destFile);

            // DB에 저장
            Connection conn = null;
            PreparedStatement pstmt = null;
            boolean isSaved = false;

            try {
                conn = DBUtill.getConnection();
                String sql = "INSERT INTO products (productName, price, description, imagePath, category) VALUES (?, ?, ?, ?, ?)";
                pstmt = conn.prepareStatement(sql);
                pstmt.setString(1, productName);
                pstmt.setString(2, price);
                pstmt.setString(3, description);
                pstmt.setString(4, "images/" + upFileName);
                pstmt.setString(5, category);
                pstmt.executeUpdate();
                isSaved = true;
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                if (pstmt != null) try { pstmt.close(); } catch (Exception e) { e.printStackTrace(); }
                if (conn != null) try { conn.close(); } catch (Exception e) { e.printStackTrace(); }
            }

            if (isSaved) {
                model.addAttribute("message", "파일 업로드 및 데이터 저장 성공!");
            } else {
                model.addAttribute("message", "파일 업로드는 성공했지만, 데이터베이스에 저장 중 오류가 발생했습니다.");
            }

        } catch (IOException e) {
            e.printStackTrace();
            model.addAttribute("message", "파일 업로드 중 오류가 발생했습니다: " + e.getMessage());
        }

        return "showcase/uploadResult"; // uploadResult.jsp를 반환
    }
}
