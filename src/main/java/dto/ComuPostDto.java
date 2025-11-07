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
}
