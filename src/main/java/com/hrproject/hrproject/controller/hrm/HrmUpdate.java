package com.hrproject.hrproject.controller.hrm;

import com.hrproject.hrproject.dao.HrmDao;
import com.hrproject.hrproject.dto.HrmDto;
import com.hrproject.hrproject.utils.ScriptWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import net.coobird.thumbnailator.Thumbnails;
import net.coobird.thumbnailator.name.Rename;

import java.io.File;
import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.Map;

@WebServlet("/hrm/update")
@MultipartConfig
public class HrmUpdate extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int empNo = 0;
        if (req.getParameter("empNo") != null) empNo = Integer.parseInt(req.getParameter("empNo"));


        HrmDao hrmDao = new HrmDao();
        HrmDto hrmDto = hrmDao.getHrm(empNo);
        req.setAttribute("hrmUpdateDto", hrmDto);
        req.getRequestDispatcher("/WEB-INF/hrm/hrm-update.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Part profile = req.getPart("profile");
        String renameProfile = "";
        //String originalProfile = "";


        String fileName = profile.getSubmittedFileName();
        String serverUploadDir = this.getServletContext().getRealPath("upload");
        File dir = new File(serverUploadDir);
        if (!dir.exists()) {
            dir.mkdir();
        }
        if (!fileName.isEmpty()) {
            profile.write(serverUploadDir + File.separator + fileName); // 원본파일을 미리 써놓기
            String first = fileName.substring(0, fileName.lastIndexOf(".")); // 파일명은 항상 파일명.확장자명 으로 들어올테니 .을 구분
            String extension = fileName.substring(fileName.lastIndexOf("."));
            LocalDateTime now = LocalDateTime.now();
            DateTimeFormatter dateTimeFormatter =
                    DateTimeFormatter.ofPattern("YYYYMMdd_hhmmss");

            String formatNow = now.format(dateTimeFormatter);
            renameProfile = first + "_" + formatNow + extension;

            File oldFile = new File(serverUploadDir + File.separator + fileName);
            File newFile = new File(serverUploadDir + File.separator + renameProfile);

            Thumbnails.of(oldFile)
                    //.sourceRegion(Positions.CENTER,100,200);
                    .size(100, 200)
                    .toFiles(dir, Rename.NO_CHANGE);
            oldFile.renameTo(newFile);
        }
        // 서버에 이미지 올리는것도 다 돈이다.

        Map<Integer, String> deptMap = new HashMap<>();
        deptMap.put(10, "개발팀");
        deptMap.put(20, "영업팀");
        deptMap.put(30, "인사팀");
        deptMap.put(40, "회계팀");
        int deptNo = Integer.parseInt(req.getParameter("deptNo"));

        Map<Integer, String> positionMap = new HashMap<>();
        // 사원 대리 과장 차장 대표이사
        positionMap.put(10, "사원");
        positionMap.put(20, "대리");
        positionMap.put(30, "과장");
        positionMap.put(40, "차장");
        positionMap.put(50, "대표이사");
        int positionNo = Integer.parseInt(req.getParameter("positionNo"));

        /*HrmDto hrmDto = HrmDto.builder()
                .deptNo(10)
                .deptName(deptMap.get(10))
                .build();*/

        HrmDto hrmDto = HrmDto.builder()
                .empNo(Integer.parseInt(req.getParameter("empNo")))
                .ename(req.getParameter("ename"))
                .foreignName(req.getParameter("foreignName"))

                .deptNo(deptNo)
                .deptName(deptMap.get(deptNo))

                .positionNo(positionNo)
                .position(positionMap.get(positionNo))

                .mobile(req.getParameter("mobile"))
                .passport(req.getParameter("passport"))
                .email(req.getParameter("email"))

                .hireDate(req.getParameter("hireDate"))
                .hireType(req.getParameter("hireType"))

                .bankName(req.getParameter("bankName"))
                .account(req.getParameter("account"))
                .accountHolder(req.getParameter("accountHolder"))

                .postCode(req.getParameter("postCode"))
                .address(req.getParameter("address"))
                .addressDetail(req.getParameter("addressDetail"))

                .originalProfile(fileName)
                .renameProfile(renameProfile)
                .oldEmpNo(Integer.parseInt(req.getParameter("oldEmpNo")))
                .build();

        HrmDao updateHrmDao = new HrmDao();
        int updateHrmResult = updateHrmDao.updateHrm(hrmDto);
        if (updateHrmResult > 0) {
            ScriptWriter.alertAndNext(resp, "회원가입 되었습니다.", "../hrm/board");
        } else {
            ScriptWriter.alertAndBack(resp, "오류가 발생했습니다. 다시 시도해주세요.");
        }

    }
}
