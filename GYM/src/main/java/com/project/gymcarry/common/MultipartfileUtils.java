package com.project.gymcarry.common;

import org.springframework.web.multipart.MultipartFile;

public class MultipartfileUtils {

	/**
	 * <PRE>
	 * name : Multipartfile
	 * description : 파일의 ContentType 과 파일 확장자를 체크
	 * @since 2021. 11. 13.
	 * @param Multipartfile
	 * @param key
	 * @return String 
	 */
	public static String chkFileType(MultipartFile multipartFile) throws Exception {
		String extension = "";
		// 업로드 파일의 contentType
		String contentType = multipartFile.getContentType();
		if (!(contentType.equals("image/jpeg") || contentType.equals("image/jpg") || contentType.equals("image/png")
				|| contentType.equals("image/gif"))) {
			throw new Exception("허용하지 않는 파일 타입 : " + contentType);
		}
		// 파일 확장자 구하기
		String fileName = multipartFile.getOriginalFilename();
		// String[] java.lang.String.split(String regex)
		// : 정규식의 패턴 문자열을 전달해야하기 때문에 \\. 으로 처리
		String[] nameTokens = fileName.split("\\."); /// tet.mini2.jpg PNG png
		// 토큰의 마지막 index의 문자열을 가져옴 : 배열의 개수-1
		extension = nameTokens[nameTokens.length - 1].toLowerCase();
		// 이미지 파일 이외의 파일 업로드 금지
		// 파일 확장자 체크
		if (!(extension.equals("jpg") || extension.equals("jpeg") || extension.equals("png")
				|| extension.equals("gif"))) {
			throw new Exception("허용하지 않는 파일 확장자 타입 : " + contentType);
		}
		return extension;
	}
}
