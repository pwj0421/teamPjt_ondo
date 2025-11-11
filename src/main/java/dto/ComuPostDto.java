package dto;

import java.util.Date;

public class ComuPostDto {
    private int post_id;
    private String m_id;
    private String title;
    private String content;
    private Date create_at;
    private Date update_at;
    private int hit;

    private String m_name; // 작성자 이름 (join 용)
    
    public ComuPostDto() {
	}
    
	// Getter & Setter
    public int getPost_id() { return post_id; }
    public void setPost_id(int post_id) { this.post_id = post_id; }

    public String getM_id() { return m_id; }
    public void setM_id(String m_id) { this.m_id = m_id; }

    public String getTitle() { return title; }
    public void setTitle(String title) { this.title = title; }

    public String getContent() { return content; }
    public void setContent(String content) { this.content = content; }

    public Date getCreate_at() { return create_at; }
    public void setCreate_at(Date create_at) { this.create_at = create_at; }

    public Date getUpdate_at() { return update_at; }
    public void setUpdate_at(Date update_at) { this.update_at = update_at; }

    public int getHit() { return hit; }
    public void setHit(int hit) { this.hit = hit; }

    public String getM_name() { return m_name; }
    public void setM_name(String m_name) { this.m_name = m_name; }
	
    //인덱스 인기글, 자유게시판 리스트 content-> create_at
    public ComuPostDto(int post_id, String title, String content, int hit, String m_name) {
		this.post_id = post_id;
		this.title = title;
		this.content = content;
		this.hit = hit;
		this.m_name = m_name;
	}

    //통합검색 자유게시판 검색 m_id -> reg_date
	public ComuPostDto(int post_id, String m_id, String title, String content, int hit, String m_name) {
		super();
		this.post_id = post_id;
		this.m_id = m_id;
		this.title = title;
		this.content = content;
		this.hit = hit;
		this.m_name = m_name;
	}
    
}
