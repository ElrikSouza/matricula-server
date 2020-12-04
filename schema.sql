create table student (
    _id serial primary key,
    student_name varchar(70)
); 

create table user_account (
    _id serial primary key,
    email varchar(244) not null unique,
    password char(60) not null,
    student_id bigint references student(_id) on delete cascade
);

create table course (
    _id serial primary key,
    course_name varchar(70)
);

create table course_prerequisites (
    course_id bigint references course(_id) on delete cascade,
    prerequisite_id bigint references course(_id) on delete cascade
);

create index course_pre_index on course_prerequisites(course_id);

create table student_course_record (
    student_id bigint references student(_id) on delete cascade,
    course_id bigint references course(_id) on delete cascade,
    completion_status smallint not null default 1
);

create unique index student_course_id on student_course_record(student_id, course_id);

create table enrollment_queue (
    student_id bigint references student(_id) on delete cascade,
    course_id bigint references course(_id) on delete cascade,
    created_at timestamptz not null default now()
);
