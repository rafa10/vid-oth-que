<?php

namespace VideothequeBundle\Form;

use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;
use Symfony\Bridge\Doctrine\Form\Type\EntityType;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Form\Extension\Core\Type\TextareaType;


class MoviesType extends AbstractType
{
    /**
     * {@inheritdoc}
     */
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder
        ->add('title', TextType::class)
        ->add('description', TextareaType::class, array('attr'=> array('class'=>'materialize-textarea')))
        ->add('image', TextType::class)
        ->add('categories',  EntityType::class, array(
           'class' =>'VideothequeBundle:Categories',
           'choice_label' =>'name',
        ))
        ->add('created_at', 'Symfony\Component\Form\Extension\Core\Type\DateType', [
              'widget' => 'single_text',
              'format' => 'dd-MM-yyyy',
              'attr' => [
                  'class' => 'datepicker',
                  'data-provide' => 'datepicker',
                  'data-date-format' => 'dd-mm-yyyy'
              ]
          ])        
        ;
    }
    
    /**
     * {@inheritdoc}
     */
    public function configureOptions(OptionsResolver $resolver)
    {
        $resolver->setDefaults(array(
            'data_class' => 'VideothequeBundle\Entity\Movies'
        ));
    }

    /**
     * {@inheritdoc}
     */
    public function getBlockPrefix()
    {
        return 'videothequebundle_movies';
    }


}
