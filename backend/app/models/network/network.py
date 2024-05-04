from app import db

class FacultyGroupNetwork(db.Model):
    __tablename__ = 'faculty_group_network'

    faculty_id = db.Column(db.Integer, db.ForeignKey('faculties.faculty_id'), primary_key=True)
    research_group_id = db.Column(db.Integer, db.ForeignKey('research_groups.research_group_id'), primary_key=True)

    # faculty = db.relationship('Faculty', backref='resarch_groups')
    # research_group = db.relationship('ResearchGroup', backref='faculties')

class FacultyResearchNetwork(db.Model):
    __tablename__ = 'faculty_research_network'

    faculty_id = db.Column(db.Integer, db.ForeignKey('faculties.faculty_id'), primary_key=True)
    research_keyword_id = db.Column(db.Integer, db.ForeignKey('research_keywords.research_keyword_id'), primary_key=True)

    # faculty = db.relationship('Faculty', backref='research_keywords')
    # research_keyword = db.relationship('ResearchKeyword', backref='faculties')
