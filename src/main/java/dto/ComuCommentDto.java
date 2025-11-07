package dto;

import java.util.Date;

public class ComuCommentDto {
    private int comment_id;
    private int post_id;
    private String m_id;
    private String comment_content;
    private Date create_at;
    private Date update_at;

    private String m_name; // 작성자 이름

    // Getter & Setter
    public int getComment_id() { return comment_id; }
    public void setComment_id(int comment_id) { this.comment_id = comment_id; }

    public int getPost_id() { return post_id; }
    public void setPost_id(int post_id) { this.post_id = post_id; }

    public String getM_id() { return m_id; }
    public void setM_id(String m_id) { this.m_id = m_id; }

    public String getComment_content() { return comment_content; }
    public void setComment_content(String comment_content) { this.comment_content = comment_content; }

    public Date getCreate_at() { return create_at; }
    public void setCreate_at(Date create_at) { this.create_at = create_at; }

    public Date getUpdate_at() { return update_at; }
    public void setUpdate_at(Date update_at) { this.update_at = update_at; }

    public String getM_name() { return m_name; }
    public void setM_name(String m_name) { this.m_name = m_name; }
}
