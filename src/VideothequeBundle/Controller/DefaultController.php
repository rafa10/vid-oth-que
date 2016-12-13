<?php

namespace VideothequeBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;

class DefaultController extends Controller
{
    public function indexAction()
    {
        return $this->render('VideothequeBundle:Default:index.html.twig');
    }
}
