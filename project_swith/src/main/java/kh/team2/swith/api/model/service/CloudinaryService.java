package kh.team2.swith.api.model.service;

import java.io.IOException;
import java.util.Map;

public interface CloudinaryService {
	public Map<String, String> upload(byte[] fileBytes, String folderPath) throws IOException;
	public Map<String, String> upload(String url, String folderPath) throws IOException;
	public String delete(String publicId) throws IOException;
}
