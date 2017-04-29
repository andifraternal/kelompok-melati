/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
var express = require('express');
var router = express.Router();
var DataModel = require('../models/m_jenis_penerima');

router.get('/:id?', function (req, res, next) {

    if (req.params.id) {

        DataModel.getById(req.params.id, function (err, rows) {
            if (err)
            {
                res.json(err);
            } else {
                res.json(rows);
            }
        });
    } else {

        DataModel.getAll(function (err, rows) {

            if (err)
            {
                res.json(err);
            } else
            {
                res.json(rows);
            }

        });
    }
});
router.post('/', function (req, res, next) {

    DataModel.Tambah(req.body, function (err, count) {

        //console.log(req.body);
        if (err)
        {
            res.json(err);
        } else {
            res.json(req.body);//or return count for 1 & 0
        }
    });
});
router.post('/:id', function (req, res, next) {
    DataModel.HapusAll(req.body, function (err, count) {
        if (err)
        {
            res.json(err);
        } else
        {
            res.json(count);
        }
    });
});
router.delete('/:id', function (req, res, next) {

    DataModel.Hapus(req.params.id, function (err, count) {

        if (err)
        {
            res.json(err);
        } else
        {
            res.json(count);
        }

    });
});
router.put('/:id', function (req, res, next) {

    DataModel.Update(req.params.id, req.body, function (err, rows) {

        if (err)
        {
            res.json(err);
        } else
        {
            res.json(rows);
        }
    });
});
module.exports = router;
