BEGIN TRANSACTION;

--Creating the plannings table
CREATE TABLE IF NOT EXISTS "PLANNINGS" (
    "planning_id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "creation_date" TIMESTAMP,
    "distance" DOUBLE
);


-- Creating the "DRIVINGSCENARIOS" table
CREATE TABLE IF NOT EXISTS "DRIVINGSCENARIOS" (
    "scenario_id" INTEGER PRIMARY KEY AUTOINCREMENT,
    "scenario_name" TEXT NOT NULL
);


CREATE TABLE "PLANNEDSCENARIO" (
    "id" INTEGER PRIMARY KEY AUTOINCREMENT,
    "planning_id" INTEGER,
    "scenario_name" TEXT,
    FOREIGN KEY (planning_id) REFERENCES PLANNINGS(planning_id),
    FOREIGN KEY (scenario_name) REFERENCES DRIVINGSCENARIOS(scenario_name)
);


-- Inserting fake data into the "PLANNINGS" table
INSERT INTO PLANNINGS (planning_id, creation_date, distance)
VALUES
(1, '2024-02-13 10:30:00', 1),
(2, '2024-02-14 15:45:00', 2),
(3, '2024-02-15 08:00:00', 1.5);

-- Inserting concise driving scenarios into the "DRIVINGSCENARIOS" table
INSERT INTO DRIVINGSCENARIOS (scenario_id, scenario_name)
VALUES
(1, 'Parallel Parking'),
(2, 'Three-Point Turn'),
(3, 'Lane Change'),
(4, 'Merge onto Highway'),
(5, 'U-Turn'),
(6, 'Stop'),
(7, 'Roundabout'),
(8, 'S-Parking'),
(9, 'Speed limit'),
(10, 'Yield to Pedestrians'),
(11, 'Emergency Stop'),
(12, 'Obey Traffic Signals'),
(13, 'Bad Weather'),
(14, 'Night driving'),
(15, 'Uphill start');


-- Inserting fake data into the "PLANNEDSCENARIO" table
INSERT INTO PLANNEDSCENARIO (id, planning_id, scenario_name)
VALUES
(1, 1, 'Parallel Parking'),
(2, 1, 'Three-Point Turn'),
(3, 1, 'Lane Change'),
(4, 2, 'Merge onto Highway'),
(5, 2, 'U-Turn'),
(6, 2, 'Stop'),
(7, 3, 'Roundabout'),
(8, 3, 'S-Parking'),
(9, 3, 'Speed limit'),
(10, 3, 'Yield to Pedestrians'),
(11, 3, 'Emergency Stop'),
(12, 3, 'Obey Traffic Signals'),
(13, 3, 'Bad Weather'),
(14, 3, 'Night driving'),
(15, 3, 'Uphill start');



CREATE TABLE IF NOT EXISTS "LESSONS" (lesson_id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,rif_evaluation INTEGER, lessonDate TIMESTAMP,
FOREIGN KEY (rif_evaluation) REFERENCES EVALUATION(idRow));

INSERT INTO LESSONS(lesson_id,rif_evaluation,lessonDate)
VALUES
(1, 1, '2024-02-13 10:30:00'),
(2, 2, '2024-02-14 15:45:00'),
(3, -1, '2024-02-15 08:00:00' );




CREATE TABLE IF NOT EXISTS "ROUTES" (route_id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT, routeName TEXT, distanceInKm FLOAT);

INSERT INTO ROUTES(route_id,routeName,distanceInKm)
VALUES
(1,'Corso Ferrucci',3),
(2,'Corso Trapani',2),
(3,'Via Virle',1);


CREATE TABLE IF NOT EXISTS "LINKLessonScenario" (idRow INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,rif_lesson INTEGER,scenario_id INTEGER, scenario_is_mistake BOOL,
	 FOREIGN KEY (rif_lesson) REFERENCES LESSONS(lesson_id),
    FOREIGN KEY (scenario_id) REFERENCES DRIVINGSCENARIOS(id));
		--scenario_is_mistake (BOOL -> FALSE=DrivingScenario,TRUE=Mistake)

INSERT INTO LINKLessonScenario(idRow,rif_lesson,scenario_id)
VALUES
(1,1,1),
(2,1,3),
(3,1,5),
(4,2,2),
(5,2,4),
(6,2,6),
(7,3,7),
(8,3,8),
(9,3,9);

CREATE TABLE IF NOT EXISTS "LINKLessonRoute" (idRow INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT, rif_lesson INTEGER, rif_route INTEGER
	FOREIGN KEY (rif_lesson) REFERENCES LESSONS(lesson_id),
	FOREIGN KEY (rif_route) REFERENCES ROUTES(route_id));


INSERT INTO LINKLessonRoute(idRow,rif_lesson,rif_route)
VALUES
(1,1,1),
(2,1,2),
(3,2,3),
(4,2,1),
(5,3,3);

CREATE TABLE IF NOT EXISTS "EVALUATION" (idRow INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,rif_lesson INTEGER, grade INTEGER, evaluationDate TIMESTAMP,
	FOREIGN KEY (rif_lesson) REFERENCES LESSONS(lesson_id));

INSERT INTO EVALUATION(idRow,rif_lesson,grade,evaluationDate)
VALUES
(1,1,4,'2024-02-13 14:40:00'),
(2,2,5,'2024-02-18 10:00:00');


COMMIT;
