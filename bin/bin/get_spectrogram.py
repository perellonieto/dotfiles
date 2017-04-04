#!/usr/bin/python
import numpy as np
import matplotlib.pyplot as plt
from matplotlib import mlab
from scipy.io import wavfile

import argparse

def parse_arguments():
    parser = argparse.ArgumentParser(description='Generates a spectrogram plot from the specified audio file.')
    parser.add_argument('audio_file', metavar='F', type=str,
                        help='The audio file from which to generate the spectrogram')
    parser.add_argument('--NFFT', dest='NFFT', type=int,
                        default='4096', help='Length of the FFT used')
    parser.add_argument('-o', '--overlap', dest='overlap', type=float,
                        default='0.5', help='Percentage of overlap between windows')
    parser.add_argument('-e', '--extension', dest='extension', type=str,
                        default='jpg', help='Extension for the generated image')

    return parser.parse_args()

def my_specgram(x, NFFT=256, Fs=2, noverlap=128, minfreq=None, maxfreq=None):
    Pxx, freqs, bins = mlab.specgram(x, NFFT=NFFT, Fs=Fs, noverlap=noverlap)

    if minfreq is not None:
        Pxx = Pxx[freqs >= minfreq]
        freqs = freqs[freqs >= minfreq]
    if maxfreq is not None:
        Pxx = Pxx[freqs <= maxfreq]
        freqs = freqs[freqs <= maxfreq]

    return Pxx, freqs, bins

def my_plot_specgram(samples_A4_C5_E5, NFFT=256, Fs=2, noverlap=128,
                     minfreq=None, maxfreq=None):
    """

    Adapted from:
     http://stackoverflow.com/questions/19468923/cutting-of-unused-frequencies-in-specgram-matplotlib
    """
    fig = plt.gcf()
    ax = plt.gca()

    Pxx, freqs, bins = my_specgram(samples_A4_C5_E5, NFFT=NFFT, Fs=Fs,
                                   noverlap=noverlap, minfreq=minfreq,
                                   maxfreq=maxfreq)

    # Transform into dB
    Z = 10. * np.log10(Pxx)
    # Flip image upside-down
    Z = np.flipud(Z)

    extent = [0, bins.max(), freqs[0], freqs[-1]]

    im = ax.imshow(Z, extent=extent, aspect='auto')
    ax.set_xlabel('Time (s)')
    ax.set_ylabel('Frequency (Hz)')
    cb = fig.colorbar(im)
    cb.set_label('dB')

    return Pxx, freqs, bins, im

def main(audio_file, NFFT=4096, overlap=0.5, extension='svg'):
    noverlap = int(NFFT*overlap)

    Fs, frames = wavfile.read(audio_file)

    if len(frames.shape) > 1:
        channels = np.array(frames[:,0])
    else:
        channels = frames

    minfreq = 20
    maxfreq = 15000

    fig = plt.figure()
    print Fs
    Pxx, freqs, t, plot = my_plot_specgram(channels, NFFT=NFFT, Fs=Fs,
                                           noverlap=noverlap, minfreq=minfreq,
                                           maxfreq=maxfreq)

    filename = "{}_fs{}_NFFT{}_ol{}.{}".format(audio_file.split('.')[-2], Fs,
                                               NFFT, int(overlap*100), extension)
    plt.savefig(filename)

if __name__ == '__main__':
    args = parse_arguments()
    main(args.audio_file, NFFT=args.NFFT, overlap=args.overlap,
         extension=args.extension)
