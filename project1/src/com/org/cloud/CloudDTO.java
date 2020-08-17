package com.org.cloud;

public class CloudDTO {
	private String id;
	private String title;
	private String content;
	private String filename;
	private String filesize;
	private String reg_date;
	private String upload_date;

	public CloudDTO(String title, String content, String filename, String filesize, String reg_date, String upload_date) {
		super();
		this.title = title;
		this.content = content;
		this.filename = filename;
		this.filesize = filesize;
		this.reg_date = reg_date;
		this.upload_date = upload_date;
	}

	public CloudDTO() {

	}

	public String getUpload_date() {
		return upload_date;
	}

	public void setUpload_date(String upload_date) {
		this.upload_date = upload_date;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getReg_date() {
		return reg_date;
	}

	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}

	public String getFilesize() {
		return filesize;
	}

	public void setFilesize(String filesize) {
		this.filesize = filesize;
	}
}
