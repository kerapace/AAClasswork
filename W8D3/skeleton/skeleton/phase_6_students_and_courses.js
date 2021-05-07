function Student(first_name, last_name) {
    this.first_name = first_name;
    this.last_name = last_name;
    this.courses = [];
}

function Course(name,department,credits,days,block) {
    this.name = name;
    this.department = department;
    this.credits = credits;
    this.days = days;
    this.block = block;
    this.students = [];
}

Student.prototype.name = function () {
    return `${this.first_name} ${this.last_name}`;
}

Student.prototype.enroll = function (course) {
    if(!this.courses.includes(course)) {
        this.courses.forEach(el => {
            if(el.conflicts_with(course)) {
                throw "course conflict, please try again";
            }
        })
        this.courses.push(course);
        course.addStudent(this)
    }
}

Course.prototype.conflicts_with = function(course) {
    if(course.block !== this.block) {
        return false;
    }
    return this.days.some(day => course.days.includes(day));
}

Course.prototype.addStudent = function(student) {
    if(!this.students.includes(student)) {
        this.students.push(student);
    }
}

Student.prototype.courseLoad = function() {
    let load = {};
    this.courses.forEach(course => load[course.department] += course.credits);
    return load;
}
