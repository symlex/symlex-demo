<?php

namespace App\Controller\Rest\V1;

use App\Exception\DemoException;
use App\Exception\Exception;
use App\Form\FormFactory;
use App\Form\User\RegisterCompleteForm;
use App\Form\User\RegisterForm;
use App\Model\ModelFactory;
use App\Model\User;
use App\Service\Captcha;
use App\Service\Mail;
use Symfony\Component\HttpFoundation\Request;

/**
 * @see https://github.com/symlex/symlex#rest
 */
class RegistrationController
{
    protected $mail;
    protected $captcha;
    protected $formFactory;
    protected $modelFactory;

    public function __construct(Captcha $captcha, Mail $mail, ModelFactory $modelFactory, FormFactory $formFactory)
    {
        $this->captcha = $captcha;
        $this->setMailService($mail);
        $this->modelFactory = $modelFactory;
        $this->formFactory = $formFactory;
    }

    public function setMailService(Mail $mail)
    {
        $this->mail = $mail;
    }

    public function getMailService(): Mail
    {
        if (!$this->mail) {
            throw new Exception('Mail service not set');
        }

        return $this->mail;
    }

    protected function createRegisterForm(): RegisterForm
    {
        $params = array(
            'captcha' => $this->captcha
        );

        /** @var RegisterForm $result */
        $result = $this->formFactory->create('User\Register', $params);

        return $result;
    }

    protected function createRegisterCompleteForm(): RegisterCompleteForm
    {
        $params = array();

        /** @var RegisterCompleteForm $result */
        $result = $this->formFactory->create('User\RegisterComplete', $params);

        return $result;
    }

    protected function createModel(): User
    {
        /** @var User $result */
        $result = $this->modelFactory->create('User');

        return $result;
    }

    public function optionsAction(string $token)
    {
        if ($token == 'new') {
            $form = $this->createRegisterForm();
            $form->initCaptcha();
        } else {
            $form = $this->createRegisterCompleteForm();
            $model = $this->createModel()->findByVerificationToken($token);
            $form->userFirstName = $model->userFirstName;
            $form->userLastName = $model->userLastName;
            $form->userEmail = $model->userEmail;
        }

        return $form->getAsArray();
    }

    public function postAction(Request $request)
    {
        throw new DemoException('Disabled in demo');
    }

    public function putAction($token, Request $request)
    {
        throw new DemoException('Disabled in demo');
    }
}
