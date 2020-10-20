#!/usr/bin/env python

import argparse
import qrcode

def parse_arguments():
    '''Parses the script arguments'''
    parser = argparse.ArgumentParser(description='''Generates individual QR
                                     codes for every wearable in a house for
                                     the sphere home annotation Android app''',
                                     formatter_class=argparse.ArgumentDefaultsHelpFormatter)
    parser.add_argument('string', type=str,
                        help='String for the qr code')
    parser.add_argument('-o', '--outputfile', type=str, default='output_qr.pdf',
                        help='Output file name')
    return parser.parse_args()


def main(string, outputfile):
    qr = qrcode.QRCode(version=1,
                       error_correction=qrcode.constants.ERROR_CORRECT_L,
                       box_size=10, border=4)
    qr.add_data(string)
    qr.make(fit=True)
    img = qr.make_image()
    img.save(outputfile)


if __name__ == '__main__':
    args = parse_arguments()
    main(**vars(args))
