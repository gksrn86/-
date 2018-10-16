package edu.smu.ss.vo;

public class local {
	private String title;
	private String link;
	private String description;
	private String telephone;
	private String address;
	private String roadAddress;
	private Integer mapx;
	private Integer mapy;
	
	public local() {
		super();
	}

	public local(String title, String link, String description, String telephone, String address, String roadAddress,
			Integer mapx, Integer mapy) {
		super();
		this.title = title;
		this.link = link;
		this.description = description;
		this.telephone = telephone;
		this.address = address;
		this.roadAddress = roadAddress;
		this.mapx = mapx;
		this.mapy = mapy;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getLink() {
		return link;
	}

	public void setLink(String link) {
		this.link = link;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getTelephone() {
		return telephone;
	}

	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getRoadAddress() {
		return roadAddress;
	}

	public void setRoadAddress(String roadAddress) {
		this.roadAddress = roadAddress;
	}

	public Integer getMapx() {
		return mapx;
	}

	public void setMapx(Integer mapx) {
		this.mapx = mapx;
	}

	public Integer getMapy() {
		return mapy;
	}

	public void setMapy(Integer mapy) {
		this.mapy = mapy;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("local [title=");
		builder.append(title);
		builder.append(", link=");
		builder.append(link);
		builder.append(", description=");
		builder.append(description);
		builder.append(", telephone=");
		builder.append(telephone);
		builder.append(", address=");
		builder.append(address);
		builder.append(", roadAddress=");
		builder.append(roadAddress);
		builder.append(", mapx=");
		builder.append(mapx);
		builder.append(", mapy=");
		builder.append(mapy);
		builder.append("]");
		return builder.toString();
	}
	
	
}
