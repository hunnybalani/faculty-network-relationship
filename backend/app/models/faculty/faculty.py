from app import db

class Faculty(db.Model):
    __tablename__ = 'faculties'
    
    faculty_id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    faculty_name = db.Column(db.String(255), nullable=False)
    department_id = db.Column(db.Integer, db.ForeignKey('departments.department_id'))
    faculty_type = db.Column(db.Enum('teaching', 'research'), nullable=False)
    
    # department = db.relationship('Department', backref='faculties')