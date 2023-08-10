<?php
if (!defined('BASEPATH')) exit('No direct script access allowed');
class Fpdf {
    public function __construct() {
        require_once APPPATH . 'third_party/fpdf/fpdf.php';
    }
}