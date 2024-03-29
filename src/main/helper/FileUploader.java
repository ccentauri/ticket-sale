package main.helper;

import main.dao.PassportFileDAO;
import main.dao.impl.PassportFileDAOImpl;
import main.model.PassportFile;
import main.model.User;
import org.apache.log4j.Logger;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.ServletContext;
import java.io.File;
import java.io.IOException;
import java.util.List;

public class FileUploader {
    private static Logger logger;

    static {
        logger = Logger.getLogger(FileUploader.class);
    }

    public static void uploadFromMultipart(ServletContext servletContext,
                                           User user,
                                           List<MultipartFile> multipartFiles) throws NullPointerException, IOException {
        if (multipartFiles == null)
            throw new NullPointerException("List is null");

        PassportFileDAO passportFileDAO = new PassportFileDAOImpl();

        for (MultipartFile file : multipartFiles) {
            if (file == null || file.isEmpty())
                continue;

            // Upload photo file to the server
            String realPathToUploads = servletContext.getRealPath(Const.PASSPORT_SCAN_UPLOAD_PATH);
            if (!new File(realPathToUploads).exists())
                new File(realPathToUploads).mkdir();
            String filePath = realPathToUploads + file.getOriginalFilename();
            File destFile = new File(filePath);
            file.transferTo(destFile);

            // Save meta info to db
            passportFileDAO.insert(preparePassportFile(user, file));
        }
    }

    public static Boolean deleteByName(ServletContext servletContext, String name) {
        String realPathToUploads = servletContext.getRealPath(Const.PASSPORT_SCAN_UPLOAD_PATH);
        String pathToFile = realPathToUploads.concat(name);

        File file = new File(pathToFile);
        return file.delete();
    }

    private static PassportFile preparePassportFile(User user, MultipartFile file) {
        PassportFile passportFile = new PassportFile();

        passportFile.setUserData(user.getUserData());
        passportFile.setFileName(file.getOriginalFilename());

        return passportFile;
    }
}
