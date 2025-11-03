package dto;

public class CountryDto {
	private String country_code, country_name;

	public CountryDto(String country_code, String country_name) {
		this.country_code = country_code;
		this.country_name = country_name;
	}

	public String getCountry_code() {
		return country_code;
	}

	public String getCountry_name() {
		return country_name;
	}
	
	
}
