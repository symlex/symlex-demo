<?php

namespace App\Controller\Rest\V1;

use App\Exception\AccessDeniedException;
use App\Exception\DemoException;
use App\Exception\Exception;
use App\Exception\FormInvalidException;
use App\Exception\InvalidArgumentException;
use App\Model\User;
use App\Service\Mail;
use Symfony\Component\HttpFoundation\Request;

/**
 * @see https://github.com/symlex/symlex#rest
 */
class UsersController extends EntityControllerAbstract
{
    protected $modelName = 'User';
    protected $searchFormName = 'User\Search';
    protected $createFormName = 'User\Create';
    protected $editFormName = 'User\Edit';
    protected $mail;

    public function setMailService(Mail $mail)
    {
        $this->mail = $mail;
    }

    public function getMailService(): Mail
    {
        if(!$this->mail) {
            throw new Exception('Mail service not set');
        }

        return $this->mail;
    }

    public function cgetAction(Request $request)
    {
        if (!$this->session->isAdmin()) {
            throw new AccessDeniedException("You don't have permission to query this service");
        }

        $form = $this->createForm($this->searchFormName)->setDefinedWritableValues($request->query->all())->validate();

        return $this->search($form, $request);
    }

    public function optionsAction($id, Request $request)
    {
        if (!$this->session->isAdmin()) {
            throw new AccessDeniedException("You don't have permission to query this service");
        }

        return parent::optionsAction($id, $request);
    }

    public function deleteAction($id)
    {
        throw new DemoException('Disabled in demo');
    }

    public function putAction($id, Request $request)
    {
        throw new DemoException('Disabled in demo');
    }

    public function postAction(Request $request)
    {
        throw new DemoException('Disabled in demo');
    }

    public function cputPasswordAction($id, Request $request)
    {
        throw new DemoException('Disabled in demo');
    }

    public function coptionsProfileAction($id)
    {
        if ($id != $this->session->getUserId()) {
            throw new AccessDeniedException('User ID does not match');
        }

        $form = $this->createForm('User\Profile');
        $this->model->find($id);
        $form->setDefinedValues($this->model->getValues());

        return $form->getAsArray();
    }

    public function postProfileAction($id, Request $request)
    {
        throw new DemoException('Disabled in demo');
    }
}
