package com.tour.category.model;

import java.util.Date;

public class RoomFacilities {
	private int id;
	private int accomoId;
	private String blackoutCurtain;
	private String roomService;
	private String morningCall;
	private String refridge;
	private String coffeeMaker;
	private String TV;
	private String safe;
	private String telephone;
	private String airConditioner;
	private String kitchenette;
	private Date createdAt;
	private Date updatedAt;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getAccomoId() {
		return accomoId;
	}
	public void setAccomoId(int accomoId) {
		this.accomoId = accomoId;
	}
	public String getBlackoutCurtain() {
		return blackoutCurtain;
	}
	public void setBlackoutCurtain(String blackoutCurtain) {
		this.blackoutCurtain = blackoutCurtain;
	}
	public String getRoomService() {
		return roomService;
	}
	public void setRoomService(String roomService) {
		this.roomService = roomService;
	}
	public String getMorningCall() {
		return morningCall;
	}
	public void setMorningCall(String morningCall) {
		this.morningCall = morningCall;
	}
	public String getRefridge() {
		return refridge;
	}
	public void setRefridge(String refridge) {
		this.refridge = refridge;
	}
	public String getCoffeeMaker() {
		return coffeeMaker;
	}
	public void setCoffeeMaker(String coffeeMaker) {
		this.coffeeMaker = coffeeMaker;
	}
	public String getTV() {
		return TV;
	}
	public void setTV(String tV) {
		TV = tV;
	}
	public String getSafe() {
		return safe;
	}
	public void setSafe(String safe) {
		this.safe = safe;
	}
	public String getTelephone() {
		return telephone;
	}
	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}
	public String getAirConditioner() {
		return airConditioner;
	}
	public void setAirConditioner(String airConditioner) {
		this.airConditioner = airConditioner;
	}
	public String getKitchenette() {
		return kitchenette;
	}
	public void setKitchenette(String kitchenette) {
		this.kitchenette = kitchenette;
	}
	public Date getCreatedAt() {
		return createdAt;
	}
	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}
	public Date getUpdatedAt() {
		return updatedAt;
	}
	public void setUpdatedAt(Date updatedAt) {
		this.updatedAt = updatedAt;
	}
	
}
