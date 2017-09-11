#!/Library/Frameworks/Python.framework/Versions/3.6/bin/python3




if __name__=='__main__':
    import numpy as np
    import matplotlib.pyplot as plt
    from matplotlib.ticker import MultipleLocator
    from matplotlib.ticker import LinearLocator
    from matplotlib.ticker import AutoMinorLocator

    x=[280,300,320,340,360,380,400,420,440,460,480,500,520,540,560,580,600,620,640,660]
    y=[0.0,  1.39, 8.54, 16.9, 20.3, 20.6, 21.1, 20.2,18.8, 16.7, 14.0, 11.6, 8.06,  4.32, 2.646, 1.462,0.756, 0.508, 0.158, 0.00]
    y2=[]
    
    for y_ in y:
        y2.append(y_*.01)

    


    plt.plot(x,y2,lw=2,color="black",ls="-")


    ax=plt.gca()


    ax.set_ylim([0,.3])
    ax.set_xlim([200,700])

    ax.xaxis.set_tick_params(length=10,direction='in',top='on')
    ax.xaxis.set_tick_params(which='minor',length=5,direction='in',top='on')
    ax.yaxis.set_tick_params(length=10,direction='in',right='on')
    ax.yaxis.set_tick_params(which='minor',length=5,direction='in',right='on')
    ax.xaxis.set_minor_locator(AutoMinorLocator(5))
    ax.yaxis.set_minor_locator(AutoMinorLocator(5))

    ax_cherenkov=ax.twinx()
    x_cherenkov=np.linspace(200,700,500)
    y_cherenkov=[]
    alpha=1.0/137.035999139
    pi=3.14159
    n=1.33
    for x_ in x_cherenkov:
        y_cherenkov.append(1e7*2*pi*alpha*(1-1.0/(n*n))/(x_*x_))

    ax_cherenkov.plot(x_cherenkov,y_cherenkov,lw=2,color='r',ls='-')
    

    ax_cherenkov.set_xlim([200,700])
    ax_cherenkov.set_ylim([0,6])
    ax_cherenkov.yaxis.set_tick_params(length=10,direction='in',right='on')
    ax_cherenkov.yaxis.set_tick_params(which='minor',length=5,direction='in',right='on')
    ax_cherenkov.yaxis.set_minor_locator(AutoMinorLocator(5))

    ax.set_ylabel("Quantum Efficiency",size=16)
    ax.set_xlabel("Wavelength (nm)",size=16)
    ax_cherenkov.set_ylabel(r'$\frac{d^2N}{dxd\lambda} (\frac{\mathrm{photons}}{\mathrm{cm}\times\mathrm{nm}})$',color='r',size=16,rotation=270,va='bottom')
    for t1 in ax_cherenkov.get_yticklabels():
        t1.set_color("r")
    
    plt.show()
