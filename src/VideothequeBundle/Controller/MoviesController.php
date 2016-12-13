<?php

namespace VideothequeBundle\Controller;

use VideothequeBundle\Entity\Movies;
use VideothequeBundle\Form\MoviesType;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;

class MoviesController extends Controller
{

    /**
     * @Route("/show")
     */
    public function ShowAction($id)
    {
       $em = $this->getDoctrine()->getManager();

       $movie = $em->getRepository('VideothequeBundle:Movies')->findOneById($id);


       $categories = $em->getRepository('VideothequeBundle:Categories')->findAll(); 
       return $this->render('VideothequeBundle:Movies:show.html.twig', array(
            'movie' => $movie,
            'categories' => $categories
        ));
    }

    /**
     * @Route("/Create")
     */
    public function CreateAction(Request $request)
    {
        $em = $this->getDoctrine()->getManager();

        $movies = new Movies();

        $form =  $this->createForm(MoviesType::class, $movies);
        if($request->isMethod('POST')){
            $form->handleRequest($request);

            if ($form->isValid()) {
                $em->persist($movies);
                $em->flush();

                $message = \Swift_Message::newInstance()
                     ->setSubject('Film ajoutée')
                     ->setFrom('support@videotheque.com')
                     ->setTo('c67072fae2-191be6@inbox.mailtrap.io')
                     ->setCharset('utf-8')
                     ->setContentType('text/html')
                     ->setBody($this->renderView('VideothequeBundle:email:add_movie.html.twig', array('movie' => $movies)));
                $this->get('mailer')->send($message);


                return $this->redirect($this->generateUrl('videotheque_homepage'));
            }
        }

        $categories = $em->getRepository('VideothequeBundle:Categories')->findAll(); 
        return $this->render('VideothequeBundle:Movies:create.html.twig', array(
            'form' => $form->createView(),
            'categories'=> $categories
        ));
    }

    /**
     * @Route("/Update")
     */
    public function UpdateAction(Request $request, $id)
    {

        $em = $this->getDoctrine()->getManager();

        $movies = $em->getRepository('VideothequeBundle:Movies')->findOneById($id);

        $form = $this->createForm(MoviesType::class, $movies);
        if($request->isMethod('POST')){
            $form->handleRequest($request);

            if ($form->isValid()) {
                $em->persist($movies);
                $em->flush();

            }
        }

        $categories = $em->getRepository('VideothequeBundle:Categories')->findAll(); 
        return $this->render('VideothequeBundle:Movies:update.html.twig', array(
            'form'=>$form->createView(),
            'categories' => $categories
        ));
    }

    /**
     * @Route("/Destroy")
     */
    public function DestroyAction($id)
    {
       $em = $this->getDoctrine()->getManager();

       $movies = $em->getRepository('VideothequeBundle:Movies')->find($id);

       $message = \Swift_Message::newInstance()
             ->setSubject('Film supprimer')
             ->setFrom('support@videotheque.com')
             ->setTo('c67072fae2-191be6@inbox.mailtrap.io')
             ->setCharset('utf-8')
             ->setContentType('text/html')
             ->setBody($this->renderView('VideothequeBundle:email:delete_movie.html.twig', array('movie' => $movies)));
       $this->get('mailer')->send($message);

       $em->remove($movies);
       $em->flush();

       

       return $this->redirect($this->generateUrl('videotheque_homepage'));
    }

    

}
