package common;

import java.sql.Date;

public class DonationVO {
	private int bno;
	private String id;
	private int donation;
	private String donation_date;
	private String comments;
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getDonation() {
		return donation;
	}
	public void setDonation(int donation) {
		this.donation = donation;
	}
	public String getDonation_date() {
		return donation_date;
	}
	public void setDonation_date(String donation_date) {
		this.donation_date = donation_date;
	}
	public String getComments() {
		return comments;
	}
	public void setComments(String comments) {
		this.comments = comments;
	}
	
}
