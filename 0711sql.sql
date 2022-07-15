DROP TABLE t_Board CASCADE CONSTRAINTS;

CREATE table t_Board(
    articleNO number( 10 ) primary key,
    parentNO number( 10 ) default 0,
    title varchar2( 500 ) not null,
    content varchar2( 4000 ),
    imageFileName varchar2(30),
    writedate date default sysdate not null,
    id varchar2(10),
    CONSTRAINT FK_ID FOREIGN KEY(id)
    REFERENCES t_member(id)
);

CREATE table t_member(
    id varchar2 (10),
    pwd varchar2 (20),
    name varchar2 (10),
    email varchar2 (20),
    joinDate date
);

DROP TABLE t_Board CASCADE CONSTRAINTS;    

DROP TABLE t_member;
-- ȸ�� ���̺� ����
CREATE TABLE t_member(
    id VARCHAR2(20) primary key,
    pwd VARCHAR2(10),
    name VARCHAR2(50),
    email VARCHAR2(50),
    joinDate DATE DEFAULT SYSDATE
);

--ȸ�� ���� �߰�
INSERT INTO t_member
VALUES('hong', '1212', 'ȫ�浿', 'hong@gmail.com', sysdate);

INSERT INTO t_member
VALUES('lee', '1212', '�̼���', 'lee@test.com', sysdate);

INSERT INTO t_member
VALUES('kim', '1212', '������', 'kim@jweb.com', sysdate);
COMMIT;

SELECT * FROM t_member;

SELECT
    *
FROM t_board;

insert into t_board(articleNO, parentNO, title, content, imageFileName, writedate, id)
values(1, 0, '�׽�Ʈ���Դϴ�.', '�׽�Ʈ���Դϴ�.', null, sysdate, 'hong');

insert into t_board(articleNO, parentNO, title, content, imageFileName, writedate, id)
values(2, 0, '�ȳ��ϼ���.', '��ǰ �ı��Դϴ�.', null, sysdate, 'hong');

insert into t_board(articleNO, parentNO, title, content, imageFileName, writedate, id)
values(3, 2, '�亯�Դϴ�.', '��ǰ �ı⿡ ���� �亯�Դϴ�.', null, sysdate, 'hong');

insert into t_board(articleNO, parentNO, title, content, imageFileName, writedate, id)
values(5, 3, '�亯�Դϴ�.', '��ǰ �����ϴ�.', null, sysdate, 'lee');

insert into t_board(articleNO, parentNO, title, content, imageFileName, writedate, id)
values(4, 0, '������ �Դϴ�.', '������ �׽�Ʈ ���Դϴ�.', null, sysdate, 'kim');

insert into t_board(articleNO, parentNO, title, content, imageFileName, writedate, id)
values(6, 2, '��ǰ �ı��Դϴ�.', '�̼��ž��� ��ǰ ��� �ı⸦ �ø��ϴ�!!.', null, sysdate, 'lee');

commit;

select*from t_board;