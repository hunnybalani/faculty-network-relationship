from app import db

class ResearchGroup(db.Model):
    __tablename__ = 'research_groups'

    research_group_id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    research_group = db.Column(db.String(255))

class ResearchKeyword(db.Model):
    __tablename__ = 'research_keywords'

    research_keyword_id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    research_keyword = db.Column(db.String(255))