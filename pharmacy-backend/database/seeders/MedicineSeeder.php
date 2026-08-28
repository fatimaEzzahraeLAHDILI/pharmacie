<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class MedicineSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
   public function run()
{
    \App\Models\Medicine::insert([
        ['name' => 'Panadol', 'price' => 20, 'category' => 'Analgésique', 'benefits' => 'Soulage la douleur et la fièvre', 'image' => 'panadol.jpg'],
        ['name' => 'Amoxicilline', 'price' => 45, 'category' => 'Antibiotique', 'benefits' => 'Infections bactériennes', 'image' => 'amox.jpg'],
        ['name' => 'Vitamine C', 'price' => 35, 'category' => 'Vitamines', 'benefits' => 'Renforce le système immunitaire', 'image' => 'vitamine_c.jpg'],
        ['name' => 'Spasfon', 'price' => 28, 'category' => 'Antispasmodique', 'benefits' => 'Douleurs abdominales', 'image' => 'spasfon.jpg'],
        ['name' => 'Humex', 'price' => 42, 'category' => 'Rhume', 'benefits' => 'Traitement du rhume et nez bouché', 'image' => 'humex.jpg'],
        ['name' => 'Gaviscon', 'price' => 38, 'category' => 'Estomac', 'benefits' => 'Brûlures d\'estomac et reflux', 'image' => 'gaviscon.jpg'],
        ['name' => 'Magnésium B6', 'price' => 55, 'category' => 'Vitamines', 'benefits' => 'Fatigue et stress', 'image' => 'magnesium.jpg'],
        ['name' => 'Fervex', 'price' => 33, 'category' => 'Rhume', 'benefits' => 'États grippaux et frissons', 'image' => 'fervex.jpg'],
        ['name' => 'Voltaren Emulgel', 'price' => 48, 'category' => 'Anti-inflammatoire', 'benefits' => 'Douleurs musculaires et articulaires', 'image' => 'voltaren.jpg'],
        ['name' => 'Smecta', 'price' => 25, 'category' => 'Digestion', 'benefits' => 'Traitement de la diarrhée', 'image' => 'smecta.jpg'],
        ['name' => 'Aerius', 'price' => 52, 'category' => 'Allergie', 'benefits' => 'Rhinite allergique et urticaire', 'image' => 'aerius.jpg'],
        ['name' => 'Strepsils', 'price' => 30, 'category' => 'Gorge', 'benefits' => 'Maux de gorge peu intenses', 'image' => 'strepsils.jpg'],
        ['name' => 'Biafine', 'price' => 40, 'category' => 'Peau', 'benefits' => 'Brûlures superficielles et érythèmes', 'image' => 'biafine.jpg'],
        ['name' => 'Advil 400mg', 'price' => 22, 'category' => 'Anti-inflammatoire', 'benefits' => 'Douleurs et maux de tête', 'image' => 'advil.jpg'],
        ['name' => 'Meteospasmyl', 'price' => 46, 'category' => 'Digestion', 'benefits' => 'Ballonnements et gaz', 'image' => 'meteo.jpg'],
        ['name' => 'Clamoxyl', 'price' => 50, 'category' => 'Antibiotique', 'benefits' => 'Angines et otites', 'image' => 'clamoxyl.jpg'],
        ['name' => 'Zyrtec', 'price' => 39, 'category' => 'Allergie', 'benefits' => 'Symptômes allergiques saisonniers', 'image' => 'zyrtec.jpg'],
        ['name' => 'Biseptine', 'price' => 34, 'category' => 'Antiseptique', 'benefits' => 'Désinfection des plaies', 'image' => 'biseptine.jpg'],
        ['name' => 'Motilium', 'price' => 29, 'category' => 'Digestion', 'benefits' => 'Nausées et vomissements', 'image' => 'motilium.jpg'],
        ['name' => 'Efferalgan', 'price' => 18, 'category' => 'Analgésique', 'benefits' => 'Douleurs légères à modérées', 'image' => 'efferalgan.jpg'],
        ['name' => 'Dafalgan Codeiné', 'price' => 32, 'category' => 'Analgésique', 'benefits' => 'Douleurs fortes', 'image' => 'dafalgan.jpg'],
        ['name' => 'Solupred', 'price' => 60, 'category' => 'Corticoïde', 'benefits' => 'Inflammations sévères', 'image' => 'solupred.jpg'],
        ['name' => 'Augmentin', 'price' => 85, 'category' => 'Antibiotique', 'benefits' => 'Infections respiratoires', 'image' => 'augmentin.jpg'],
        ['name' => 'Loperamide', 'price' => 21, 'category' => 'Digestion', 'benefits' => 'Diarrhée passagère', 'image' => 'loperamide.jpg'],
        ['name' => 'Maalox', 'price' => 36, 'category' => 'Estomac', 'benefits' => 'Acidité gastrique', 'image' => 'maalox.jpg'],
        ['name' => 'Nurofen', 'price' => 27, 'category' => 'Anti-inflammatoire', 'benefits' => 'Fièvre et douleurs chez l\'enfant', 'image' => 'nurofen.jpg'],
        ['name' => 'Oscillococcinum', 'price' => 95, 'category' => 'Homéopathie', 'benefits' => 'Prévention des états grippaux', 'image' => 'oscillo.jpg'],
        ['name' => 'Vicks Vaporub', 'price' => 44, 'category' => 'Respiration', 'benefits' => 'Congestion nasale et toux', 'image' => 'vicks.jpg'],
        ['name' => 'Supradyn', 'price' => 70, 'category' => 'Vitamines', 'benefits' => 'Multivitamines et minéraux', 'image' => 'supradyn.jpg'],
    ]);
}
}
