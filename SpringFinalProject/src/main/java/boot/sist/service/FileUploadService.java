package boot.sist.service;

import java.io.File;
import java.io.IOException;
import java.net.URISyntaxException;
import java.net.URL;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.Date;

import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartFile;

@Service
public class FileUploadService {
	// 경로 설정 추후에 재 적용 필요
	private final String defaultPath = "src/main/resources/static/upload";
	
	public String upload(MultipartFile file, String url) {
		String fileFullName = null;
		Path uploadLocation = null;
		
		try {
			Path uploadPath = null;
			URL uploadUrl = null;
			if (url == null || "".equals(url)) {
				uploadUrl = ClassLoader.getSystemResource(defaultPath);

				if (uploadUrl == null) {
					uploadPath = Paths.get(defaultPath);

					if (!Files.exists(uploadPath)) {
						Files.createDirectory(uploadPath);
					}
				} else {
					uploadPath = Paths.get(uploadUrl.toURI());
				}
			} else {
				uploadPath = Paths.get(url);
				
				if (!Files.exists(uploadPath)) {
					new File(uploadPath.toString()).mkdirs();
				}
			}

			while (true) {
				String[] fileNameList = file.getOriginalFilename().split("\\.");
				String fileExtension = fileNameList[fileNameList.length - 1];
				String fileName = String.valueOf(new Date().getTime());
				
				fileFullName = fileName + "." + fileExtension;
				uploadLocation = Paths.get(uploadPath.toString() + File.separator + StringUtils.cleanPath(fileFullName));
								
				if (!Files.exists(uploadLocation)) {
					break;
				}
			}
			
			Files.copy(file.getInputStream(), uploadLocation, StandardCopyOption.REPLACE_EXISTING);
		} catch (URISyntaxException e) {
			e.printStackTrace();
			return null;
		} catch (IOException e) {
			e.printStackTrace();
			return null;
		}
		
		return fileFullName;
	}
}