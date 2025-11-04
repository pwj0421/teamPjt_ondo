package dto;

public class ComuWriteDto {

	private String m_id, m_name, title, content, create_at, update_at;
	private int post_id, hit;
	
	public ComuWriteDto(String m_id, String m_name, String title, String content, String create_at, String update_at,
			int post_id, int hit) {
		this.m_id = m_id;
		this.m_name = m_name;
		this.title = title;
		this.content = content;
		this.create_at = create_at;
		this.update_at = update_at;
		this.post_id = post_id;
		this.hit = hit;
	}
	public String getM_id() {
		return m_id;
	}
	public String getM_name() {
		return m_name;
	}
	public String getTitle() {
		return title;
	}
	public String getContent() {
		return content;
	}
	public String getCreate_at() {
		return create_at;
	}
	public String getUpdate_at() {
		return update_at;
	}
	public int getPost_id() {
		return post_id;
	}
	public int getHit() {
		return hit;
	}
	
	public ComuWriteDto(String m_id, String title, String content) {
		this.m_id = m_id;
		this.title = title;
		this.content = content;
	}
	
	
	
		
	
}
