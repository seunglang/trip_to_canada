package com.tour.category.model;

import java.util.Date;

public class Facilities {
	private int id;
	private int accomoId;
	private String fitness;
	private String barLounge;
	private String pool;
	private String valetParking;
	private String EVCS;
	private String banquetHall;
	private String petAllowed;
	private String luggageStorage;
	private String wifi;
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
	public String getFitness() {
		return fitness;
	}
	public void setFitness(String fitness) {
		this.fitness = fitness;
	}
	public String getBarLounge() {
		return barLounge;
	}
	public void setBarLounge(String barLounge) {
		this.barLounge = barLounge;
	}
	public String getPool() {
		return pool;
	}
	public void setPool(String pool) {
		this.pool = pool;
	}
	public String getValetParking() {
		return valetParking;
	}
	public void setValetParking(String valetParking) {
		this.valetParking = valetParking;
	}
	public String getEVCS() {
		return EVCS;
	}
	public void setEVCS(String eVCS) {
		EVCS = eVCS;
	}
	public String getBanquetHall() {
		return banquetHall;
	}
	public void setBanquetHall(String banquetHall) {
		this.banquetHall = banquetHall;
	}
	public String getPetAllowed() {
		return petAllowed;
	}
	public void setPetAllowed(String petAllowed) {
		this.petAllowed = petAllowed;
	}
	public String getLuggageStorage() {
		return luggageStorage;
	}
	public void setLuggageStorage(String luggageStorage) {
		this.luggageStorage = luggageStorage;
	}
	public String getWifi() {
		return wifi;
	}
	public void setWifi(String wifi) {
		this.wifi = wifi;
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
