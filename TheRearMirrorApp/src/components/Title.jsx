import React from 'react';
import { Col, Navbar, Row } from 'react-bootstrap';
import { Container } from 'react-bootstrap';
import { Button } from 'react-bootstrap';
import { faChevronLeft } from '@fortawesome/free-solid-svg-icons';
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome';


const Title = ({titolo}) => {
  return (
    
    <Navbar className="bg-body-tertiary">
      <Container fluid>
        <Row>
      
        <Button variant="primary" size="lg" active className="mr-auto" >
        
        <FontAwesomeIcon icon={faChevronLeft} /> {" "}
          Back

        </Button>
      
        
        </Row>
        <Navbar.Brand className="mx-auto">{titolo}</Navbar.Brand>
      </Container>
    </Navbar>
);
    
  
}

export default Title;