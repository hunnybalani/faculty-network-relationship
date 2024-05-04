from app import app
from app import db
from app.models.faculty import Faculty
from app.models.research import ResearchGroup
from app.models.department import Department
from app.models.network import FacultyGroupNetwork
from flask import jsonify

@app.route('/research-group-network', methods=['GET'])
def get_research_group_network():
    result = {}

    faculties = Faculty.query.all()

    for faculty in faculties:
        research_groups = (
            db.session.query(ResearchGroup)
            .join(FacultyGroupNetwork, FacultyGroupNetwork.research_group_id == ResearchGroup.research_group_id)
            .filter(FacultyGroupNetwork.faculty_id == faculty.faculty_id)
            .all()
        )

        research_group_names = [group.research_group for group in research_groups]

        result[faculty.faculty_name] = research_group_names

    return jsonify(result)

@app.route('/faculty/<int:faculty_id>', methods=['GET'])
def get_faculty(faculty_id):
    result = {}

    faculty = Faculty.query.get_or_404(faculty_id)

    result['faculty_name'] = faculty.faculty_name
    result['faculty_type'] = faculty.faculty_type

    department = (
        db.session.query(Department)
        .join(Faculty, Faculty.department_id == Department.department_id)
        .filter(Faculty.faculty_id == faculty_id)
        .first()
    )

    result['department_name'] = department.department_name if department else 'Unknown'

    research_groups = (
        db.session.query(ResearchGroup)
        .join(FacultyGroupNetwork, FacultyGroupNetwork.research_group_id == ResearchGroup.research_group_id)
        .filter(FacultyGroupNetwork.faculty_id == faculty_id)
        .all()
    )

    research_group_names = [group.research_group for group in research_groups]

    result['research_groups'] = research_group_names

    return jsonify(result)

@app.route('/department/<int:department_id>', methods=['GET'])
def get_department_faculty(department_id):
    department = Department.query.get_or_404(department_id)

    faculties = (
        db.session.query(Faculty)
        .filter(Faculty.department_id == department_id)
        .all()
    )

    faculty_names = [faculty.faculty_name for faculty in faculties]

    result = {
        "department": department.department_name,
        "faculties": faculty_names
    }

    return jsonify(result)

@app.route('/research-group/<int:research_group_id>', methods=['GET'])
def get_research_group_faculty(research_group_id):
    research_group = ResearchGroup.query.get_or_404(research_group_id)

    faculties = (
        db.session.query(Faculty)
        .join(FacultyGroupNetwork, FacultyGroupNetwork.faculty_id == Faculty.faculty_id)
        .filter(FacultyGroupNetwork.research_group_id == research_group_id)
        .all()
    )

    faculty_names = [faculty.faculty_name for faculty in faculties]

    result = {
        "research_group": research_group.research_group,
        "faculties": faculty_names
    }

    return jsonify(result)

@app.route('/network/reasearch-group/<int:faculty_id>', methods=['GET'])
def get_faculty_research_groups(faculty_id):
    faculty = Faculty.query.get_or_404(faculty_id)

    research_groups = (
        db.session.query(ResearchGroup)
        .join(FacultyGroupNetwork, ResearchGroup.research_group_id == FacultyGroupNetwork.research_group_id)
        .filter(FacultyGroupNetwork.faculty_id == faculty_id)
        .all()
    )

    network = []

    for research_group in research_groups:
        faculties = (
            db.session.query(Faculty)
            .join(FacultyGroupNetwork, Faculty.faculty_id == FacultyGroupNetwork.faculty_id)
            .filter(FacultyGroupNetwork.research_group_id == research_group.research_group_id)
            .all()
        )

        faculty_names = [faculty.faculty_name for faculty in faculties]

        research_group_info = {
            "research_group": research_group.research_group,
            "faculties": faculty_names
        }

        network.append(research_group_info)
    
    result = {
        "faculty": faculty.faculty_name,
        "network": network
    }

    return jsonify(result)

@app.route('/network/department/<int:faculty_id>', methods=['GET'])
def get_faculty_department(faculty_id):
    faculty = Faculty.query.get_or_404(faculty_id)

    department = (
        db.session.query(Department)
        .join(Faculty, Faculty.department_id == Department.department_id)
        .filter(Faculty.faculty_id == faculty_id)
        .first()
    )

    faculties = (
        db.session.query(Faculty)
        .filter(Faculty.department_id == faculty.department_id)
        .all()
    )

    faculty_names = [faculty.faculty_name for faculty in faculties]

    result = {
        "faculty": faculty.faculty_name,
        "department": department.department_name,
        "network": faculty_names
    }

    return jsonify(result)
