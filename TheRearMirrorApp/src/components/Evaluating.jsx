//shift alt f autoindent


import React from 'react';
import MyNavbar from './MyNavbar';
import Title from './Title';
import { Form, Row } from 'react-bootstrap';
import Col from 'react-bootstrap/Col';
import { useState } from 'react';
import RangeSlider from 'react-bootstrap-range-slider';
import Container from 'react-bootstrap/Container';
import { Lesson, Route } from './lessonDefine';
import { Link } from 'react-router-dom';
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome';
import { faCalendarAlt, faStar } from '@fortawesome/free-solid-svg-icons';


const myLesson = [];
myLesson.push(new Lesson('2023-02-14', "Red Light", 'Roundabout', 'Speeding', -1, false, 6));
const mistakes = [];
mistakes.push(("Roundabout"))
mistakes.push(("Speeding"))
mistakes.push(("Lights off"))
const scenarios = [];
scenarios.push(("Uphill Start"));
scenarios.push(("S Parking"));
scenarios.push(("Nightime Driving"));
const routes = [];
routes.push(new Route("Corso Ferrucci", 3));
routes.push(new Route("Corso Trapani", 2));
routes.push(new Route("Via Virle", 1));


const StarRating = ({ rating, onRatingChange }) => {
  const maxRating = 5;

  const handleStarClick = (clickedRating) => {
    onRatingChange(clickedRating);
  };

  return (
    <div>
      {[...Array(maxRating)].map((_, index) => (
        <FontAwesomeIcon
          key={index}
          icon={faStar}
          size="2x"
          style={{ color: index < rating ? 'black' : 'grey', cursor: 'pointer' }}
          onClick={() => handleStarClick(index + 1)}
        />
      ))}
    </div>
  );
};

const handleDistanceChange = (e) => {
  // Handle the distance value here
  console.log(e.target.value);
};


const Evaluating = () => {
  const [rating, setRating] = useState(0);

  const handleRatingChange = (newRating) => {
    setRating(newRating);
  };
  const initialDistance = myLesson.length > 0 ? myLesson[0].distance : 0;
  const [date, setDate] = useState(new Date());
  const [inputValue, setInputValue] = useState(initialDistance);
  return (

    <div>
      <header>
        <Title titolo="Evaluating"></Title>
      </header>
      <div className="scroll-element">
        <Container>
          <Row>
            <Col>
              <b>Distance</b>
            </Col>

            <Col>
              <FontAwesomeIcon icon={faCalendarAlt} size="2x" />
            </Col>
          </Row>

          <Row>

            <Col>
              <Form.Group controlId="distance">
                <Form.Control
                  type="number"
                  name="distance"
                  placeholder="Enter distance"
                  defaultValue={inputValue}
                  onChange={handleDistanceChange}
                />
              </Form.Group>
            </Col>
            <Form.Group controlId="duedate">
              <Form.Control
                type="date"
                name="duedate"
                placeholder="Date"
                value={date}
                onChange={(e) => setDate(e.target.value)}
              />
            </Form.Group>
          </Row>

          <Row>
            <Col>
              <b>Route</b>
            </Col>
          </Row>
          <Row >
            <div className="evaluating-element">
              <Row>
                {routes[0].street}, Km {routes[0].distance}
              </Row>
              <Row>
                {routes[1].street}, Km {routes[1].distance}
              </Row>
              <Row>
                {routes[2].street}, Km {routes[2].distance}
              </Row>
            </div>
          </Row>
          <Row>
            <Col>
              <b>Driving Scenarios</b>
            </Col>
          </Row>
          <Row>
          <div className="evaluating-element">
              <Row >{scenarios[0]}</Row>
              <Row>{scenarios[0]}</Row>
              <Row>{scenarios[0]}</Row>
            </div>
          </Row>
          <Row>
            <Col>
              <b>Mistakes</b>
            </Col>
          </Row>
          <Row>
          <div className="evaluating-element">
              <Row>{mistakes[0]}</Row>
              <Row>{mistakes[0]}</Row>
              <Row>{mistakes[0]}</Row>
            </div>
          </Row>
          <Row>
            <Col>
              <b>Grade</b>
            </Col>
          </Row>
          <Row>
            <Col>
              <StarRating rating={rating} onRatingChange={handleRatingChange} />
            </Col>
          </Row>
        </Container>
      </div>

      <footer className="myNavbar">
        <MyNavbar></MyNavbar>
      </footer>

    </div>

  );
};

export default Evaluating;