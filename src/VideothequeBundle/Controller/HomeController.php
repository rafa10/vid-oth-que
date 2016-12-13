<?php

namespace VideothequeBundle\Controller;

use Symfony\Component\HttpFoundation\Request;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;

class HomeController extends Controller
{
    /**
     * @Route("/Index")
     */
    public function IndexAction()
    {

    	$em = $this->getDoctrine()->getManager();

    	$movies = $em->getRepository('VideothequeBundle:Movies')->findAll();	
        
        $categories = $em->getRepository('VideothequeBundle:Categories')->findAll(); 
        return $this->render('VideothequeBundle:Home:index.html.twig', array(
            'movies' => $movies,
            'categories' => $categories
        ));
    }

    /**
     * @Route("/showbycategories")
     */
    public function ShowByCategoriesAction(Request $request, $cat)
    {

        $em = $this->getDoctrine()->getManager();
        $paginator = $this->get('knp_paginator');

        $categorie = $em->getRepository('VideothequeBundle:Categories')->findOneByName($cat);

        $query = $em->getRepository('VideothequeBundle:Movies')->findBy(array('categories' => $categorie ));          

        $pagination = $paginator->paginate($query,/* query NOT result */ $request->query->getInt('page', 1)/* page number */, 10/* limit per page */);

        $categories = $em->getRepository('VideothequeBundle:Categories')->findAll(); 
        return $this->render('VideothequeBundle:Home:movies_by_categorie.html.twig', array(
            'pagination' => $pagination,
            'categories' => $categories,
            'name' => $cat
        ));
    }


     /**
     * @Route("/search_movies")
     */
    public function SearchMoviesAction(Request $request)
    {

        $em = $this->getDoctrine()->getManager();

        if($request->getMethod()=='POST'){          
            $data = $request->get('query');

            $categorie = $em->getRepository('VideothequeBundle:Categories')->findBy(array('name' => $data));
            $movies = $em->getRepository('VideothequeBundle:Movies')->findBy(array('categories' => $categorie ));

            if(empty($movies)){
                $movies = $em->getRepository('VideothequeBundle:Movies')->searchMoviesByYear($data);
            }

        }
        $categories = $em->getRepository('VideothequeBundle:Categories')->findAll(); 
        return $this->render('VideothequeBundle:Home:search_movies.html.twig', array(
            'movies' => $movies,
            'categories' => $categories,
            'data' => $data
        ));
    }

}
