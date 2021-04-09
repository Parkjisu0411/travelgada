package com.gada.travelgada.domain;

public class Room {
	String roomName;
	
	public String getRoomName() {
		return roomName;
	}
	public void setRoomName(String roomName) {
		this.roomName = roomName;
	}
	
	@Override
	public String toString() {
		return "roomName=" + roomName;
	}	
}