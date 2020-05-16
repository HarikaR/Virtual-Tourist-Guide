import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MapScreen1 extends StatefulWidget {
  @override
  MapScreen1State createState() => MapScreen1State();
}

class MapScreen1State extends State<MapScreen1> {
  Completer<GoogleMapController> _controller = Completer();

  @override
  void initState() {
    super.initState();
  }

  double zoomVal = 5.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(FontAwesomeIcons.arrowLeft),
            onPressed: () {
              //
            }),
        title: Text("Hyderabad"),
        actions: <Widget>[
          IconButton(
              icon: Icon(FontAwesomeIcons.search),
              onPressed: () {
                //
              }),
        ],
      ),
      body: Stack(
        children: <Widget>[
          _buildGoogleMap(context),
          _zoomminusfunction(),
          _zoomplusfunction(),
          _buildContainer(),
        ],
      ),
    );
  }

  Widget _zoomminusfunction() {
    return Align(
      alignment: Alignment.topLeft,
      child: IconButton(
          icon: Icon(FontAwesomeIcons.searchMinus, color: Color(0xff6200ee)),
          onPressed: () {
            zoomVal--;
            _minus(zoomVal);
          }),
    );
  }

  Widget _zoomplusfunction() {
    return Align(
      alignment: Alignment.topRight,
      child: IconButton(
          icon: Icon(FontAwesomeIcons.searchPlus, color: Color(0xff6200ee)),
          onPressed: () {
            zoomVal++;
            _plus(zoomVal);
          }),
    );
  }

  Future<void> _minus(double zoomVal) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(target: LatLng(17.4554, 78.5008), zoom: zoomVal)));
  }

  Future<void> _plus(double zoomVal) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(target: LatLng(17.4554, 78.5008), zoom: zoomVal)));
  }

  Widget _buildContainer() {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 20.0),
        height: 150.0,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            SizedBox(width: 10.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes(
                  "https://lh3.googleusercontent.com/proxy/ji9VkhAIv-L07Iv8c1z3ojoANKbppBC-Msz0ya6qNKAELnhKAhCySk2Sta3zVHtEK4VrRD7t_GitPPnQkwnHq0oYMweVTJdIus5OLjWPiaOaRwW147m29pYwmPA",
                  17.4062,
                  78.4691,
                  "Birla Mandir"),
            ),
            SizedBox(width: 10.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes(
                  "https://img.theculturetrip.com/768x432/wp-content/uploads/2016/06/24498998325_f451c67aae_o.jpg",
                  17.3616,
                  78.4747,
                  "CharMinar"),
            ),
            SizedBox(width: 10.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes(
                  "https://3.bp.blogspot.com/-y62A9HnXRr4/U7f8wnsQFeI/AAAAAAAABq4/bxFT15Bc1Xk/s1600/Golconda-Fort.jpg",
                  17.3833,
                  78.4011,
                  "Golconda Fort"),
            ),
            SizedBox(width: 10.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes("https://static.toiimg.com/photo/38130176.cms",
                  17.3604, 78.4736, "Mecca Masjid"),
            ),
            SizedBox(width: 10.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes(
                  "https://img.traveltriangle.com/blog/wp-content/uploads/2019/11/Best-Time-To-Visit-Nehru-Zoological-Park.jpg",
                  17.3507,
                  78.4513,
                  "Nehru Zoological Park"),
            ),
            SizedBox(width: 10.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes(
                  "https://www.nkrealtors.com/blog/wp-content/uploads/2017/12/Salar-Jung-Museum-730x410.jpg",
                  17.3713,
                  78.4804,
                  "Salar Jung Museum"),
            ),
            SizedBox(width: 10.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes(
                "data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wCEAAkGBxITEhUSExMWFhUXFxcXFxgXGBcYFRcYGBgXFxcWFRcYHSggGBolGxUVITEhJSkrLi4uFx8zODMtNygtLisBCgoKDg0OGxAQGy0mHyUtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLf/AABEIALcBEwMBIgACEQEDEQH/xAAbAAACAwEBAQAAAAAAAAAAAAAEBQIDBgABB//EAEkQAAEDAgQCBwQGBQsCBwAAAAEAAhEDIQQFEjFBUQYTImFxgZEyobHRFFKyweHwQmJygvEHFSMkMzRTc5KiwkNjFjWDk6Oz0v/EABkBAAMBAQEAAAAAAAAAAAAAAAECAwQABf/EACwRAAICAQMDAwMEAwEAAAAAAAABAhEDEiExBEFRE2HwInGBFDLB4ZGh8QX/2gAMAwEAAhEDEQA/AFPW9q9vgqcWdi0lRxodpmxQVOs9vZIss8Y90etOfZjvA4kMbpe+ZuPBFYbCOPbDyBuLrLvknVsEbQxzmCA4x7lzxvlM6OVcSWyNTTxJYRLvMyfhuvcTnliGuv4LInEGZlS64lcsK5Zz6h8I1GH6QVGm8OCa1MxIbrkX2usjlb+22RNwtXimsqdiA0jeISzjFSWxXHKUovcY4HHAsLiQDHKPeo082B3aCOf4IbCYFzdj2e7ihMbScwnSNzBskjGDbGk5JWaMZlRAB1iPf6KutndIWDpPgVlaeFqOOxVGLouYCTwmU6wQ8knOXgf/AM4anWqiJ2I3TrS0tBIH3L5xl+M1spvIkOa13qAfvWlfnukBjOHF1/RHJie2kMMq5YwOYODtApgCd+CY9aNM/BZunjTVEW1Re99+SljcNUaAZMjf8Eksaunsyilta3Lc1p6jqIttCS4jFFvZAAA9fVaUPaaILjqPdYjxSTMKAgAwJvfe6pjl2FyR7oUVa5dxQ1Soi62GiQD+e5AYlpFlYzNMrNZX4XH6bG4Sx8qElVi1RFtp7GpOMBiD5KnHV58QkuFqkFF1GuebLmUUm0c7FkGQiKOILvaQwy5xTPA4CN+C7UqDGMrBKlAAk8FVo1cE0xbQbRdBso6RqI8kE0M4EK2XAIB9AXumdeq9yW1WnjZMic1XCKqAaHCdkfVwwN28eaowmGlw7rpo+BvHimbBjhtuJ8Rlh4XUKGVOKIr43S6xkBRfmhO3uXRsWax9y9mVWXqhTOoSakHkuT2Loh4/2A4io6ZVQrjiEe7CjxQ9TCcgsmxZ2RpVQbKupSXrcMRwV7KRK6vALb5IMwxhGYbDDip0acImm1dTGVE6Q0uFpV2IqEu1DzXMpSiKeHHJDSUT7BuX5o+AIiOP8UccQ2BLoJ539Uvp0IFkNUokmSdlN402V1tIeVK4aANyg89ol+GqFoDXBjzJ9kQ0mTPDzRNGqww4gk8kv6UZr/VqzQwOHVvGkRBGkiDNlJRleyGnJaXYo6MZa+phaG39ky/D2RCZYjIarRMT3DdG9BMSx2Dw7AzQRTbIMXIG9rX9rzWkpVJcQOG6WfUTjKqFhig4pmCoUnseBdrgeK1D2GqA4mD7/NXYrKNbzUm/LuR+Gy8AbJcnURaT7jwioXfAtwmUgzLpnu96niMlDmwdxxT9lAALnNEwofqJN7MHqLhIx+IyAc7hKa+Rvm4W9rYZUOo81aPUMfTCR86q5SRNkvbljpmIC+jYnDAoGrgheQtEc1iS6dGMo5Y4usnuEy3SmFGjFwiKdNO8gI4kgNmFCKbSAV4oqYoqbyF1CijqRyCg+k36oRHVlQIXKQaFuIww+r6BL8RlzTzC0EKqoE6m0TeNMQVsOWi1uVkpxlN3EytM/BDeT5oGrlbybkQqLJRGeJtbGRrtKqDStXWyUHiqX5JG11aOWJkn0k2IWAxxXJycpd9Urk/rRJfpZlmheaVU2o4K0XuknjcSsMikSFNTbhguFRSD0jg0OpJk/oyup0VQ2op60EEMZThFUQEup1AOKuZWHNOku7Bb7IaghRNNDU3g7FXtK5449mMsj7omKkCEg6Whn0Sv/S9WdNnWuZB0i+7gC3zTrUDaeMHu/HuS3OMrp12aXN1gGRJIFuMA3i6x5M8ISpW37FlCU4lfQohuDonV1h0XdbmezYm7fZ8k/wAJjqjJiI3usZhMPicJ2aTGupzOidpF9MnszYxfwTfCY8VgYDmuHtNeCCPA7OHeEU4ZBU3FUzWNzpobqdvew2XmX5w6o6NJA4fisk+q5p3MIjCZw9hsbJH0sadIZZFe5vW127ar96m3EMnTILl89xGaa3TeVVVzd1M6w4k9kT+04N+9T/ROuQOUT6Y66reyyxlHpG+LkTxPFHU+kgJgDzO58lF9JkiMq7Ma1gDxul2KraR7MjiqTWOqZufv5qOJDyYG3fACtHHT3NOrY6m+RYWUmmEHTe4kwbDYDj4I6jr+p+e8qrjQFKwymV6Wqlz3xYeqiMURuPRRcX2KJlzgqHU0HXzUA7lo8N/Nc3MmOuCD8fRcoTR2uL2stqMQzyVe7ECJQFXFSYA8z8k8ZMEkiwvUhWSutmYBg+5VUsya4xKo4NomskU6scEgryyXddF5U24lJpZTWmHwFyD+kjmuXVI64iYBSDDwRDaCtbRhejHIkeTLHqB+r5hR0o4sUDTQ9QOgFaFY1quNNetpJW0zkmisUVIYc8kTTpFHYTDSb7Df5KWScYRcm9kUjFydAuAy5777N5/LmmL8M0dls8NRntSdmg/o2uTuB4yCamJa0ExZomO4cB4n4IalVgAm7gC93PU6SfcI814uTrJ5HtsvBujhUTxzQAdobDBaxcbbchPxQ+LYG6wAAG09vf8AeqqlU6KTYJJOrz0F32iq8fUP9ZvsHDbk2nb3pYy3C1sQxwlzRtqYY8QYB9Y9Err4gw1zTBdI3iHjcefxlXV8QZoExu/3PJ/4pZjnmKzYux5cPIgn7avjlv8APsSmi8ZuDaoPPiOYIV4YHXaZCQ13SSeYDx/yH2l7gMxNF/NhiRzHd37+i9DFkZklsxy5pSbpPWLcOTP6VPjGz2nfyWrFNrgHMu0iQe5Znp9SjDCNA/pGe1vx9nv590rSpiTjUWxsyo03+F0dh3N2FjzP3IbDZe/S2w9kXHs7bjuTTLsvdqDiBCSU40VhGTZ40vbeJ79yoVMVVce1KdVHOa2Gsjv3QtN1Qzbz03UlO96RocK2sjhSGua4+7h5LVUq9MgGR5rL9UW3cfKExyrMKcw5oHf+CllhrVhrsN61NvJLMXQHNNm1WESCISjMcU24hZoOTY+N+TNZlh3ONjIS6nhnNP3p8ymCSQfLgrW4edwFsebSqF9HU7M/SxDwSNx3IilTJu4R8U6GFY3gqMSBGyk86b2RWOBrliPF02INpAPZCvx1COJVAqRwWmPBll+45zyq+vUKtSe5DlydInKQf9JXJdrXJtAvqM0VMoqk4KltDkVaMO4cFLUhqYS1rVZ1IKGbTdyV7ZSt+GMvdFlPDBXDCKpjijKVXmpylJFIxiysYZEEaWd6s12ndBYqqTK87rcsmlEvigk7I4mppaRxJYPKQT96oqwOtI5ED0YB96pxx+3/APr8FKu0RU/e/wCPzWOKoqzq9n0hPE/bA+CGeOzib/4h91NFGNdM95/+wfJDVR2cR+/8KapF/PyLJCbGHS2k6bg1T/teUPVe7ra4PFrve0H/AIovGuJa3/1R/wDGT8Ch8S0CtWF9r/8AtuV4P5+SUl8/AqdWtSJ5uHkSHfAlB1W2EcCW+hMe8FG1mjqmHjqd7qQQVYwT+397luxMx5EaHobm7GzRqAkGTTi8HctvzF/I805zSlRqt0vw+uJI1kW7wAImLTuvn1DE9XUY8foOB9HL6xiWCNln62cotU9n/Bo6RRlFprgQYDMqmHDaZpa6TQGgBw1taNgCd4GwPIXWxyzE0q1MPp2HEEQ5p5OHD71mMazj/BJarnU3aqbiw8CDH8UIZNa3Kyjo44PpbbFTFTmsDgultQDS7Tq+twPiOBWiwGbFzYcL8SSAFWWF1YFkjJ0GY/CF4gH3INmQO4u+9G0cZOxBPciBiYXLJkiqQ7gpbgdPJB9ZyDzDBmnsSnzcSVF7gdwgs+RPcGj2MdFQn9IeCZ4ewAJKaYigw8Pz3oR1KB2G+hATvMp9hoY9O5VUYvREXU8JQeLu9LIh9JSlJcFo+RJjKbTvCUuw07beEJ5jMHHaJvw/JQrMO6JJhaoSSWzITg290JcRhCgMRQLVoyB5c0pzGoCYF1eEm2ZcuOKVigkLxXmmFy1WYqZs6eXngUTSwrgqcPUcmVDE8wvGnkmvc9WEIHlNjhuJV9Om3iFfTqtKtgFZZZn3RSqBhhmqYwrVd1aEybUWOJ/xa3PYVngb9yHrOrsDaLn4Wxjkfgs3icYIWva1YPMQ9tR1MDRpdubuIBBBHiC7y9TKb1vcEZUWYzESDHMO8oN/evfpQOu+7SZnidMDxkRCCOXPcWiH7vBPAGDcd19lOjlv9mS2PakEi17Od3obIa2wk4gF1MAiRqkTcAuMEj87IfEY1mmsQ4Q7WAZEEnq4jnsfRR/m2GEE0wS4G7gDBFrztPuXsUqVTrS6idDdtTbGLWPK5TKjnYsx9UiAbTrdfeOp08+JHchMRjJrV3fqn3Nj71VnGeHE1GUWua4ud9YRYC9/2SpYnKTrcNIho2BF4jhv/Ba1Gqb8GZyu9PkEqYiWMH6z/uZb1QL6kx3unyl33EIl+WubBhwIBJN7CDtyvPqltam4Gx2Dj5bDv5ei0wS7GebfchVuO8/eSvtFUgNieH5iF8k6P0OtxNNhBsdTuI00xqN/3Y819arNBg8x9yyf+hLeK+fNjT0K2kxTiSNMEz7x8Fm8wkyOHwT3GvGvR+rq95CS42QYUsKL5XsJKzYG/wCe9G5VmJPYcf2T4cEDi39yXdcWuDhuDPovWxOjy8jpm2w+Ne0yCmrOkNQCOz4xdImtJAI2IBHmrG4dw3CvKEJcoeE5rg0+W55qcA427gtDqETNlgKdfTs2/Mq12Ncd3OPnAWTJ0+p/TsaoZ6W5squKYLTJ5C59y8a6bwR4rLYXEu/RAHv+KNbUcfae75KUsOnuaIZb7Gga+FYK44hZVuJDSe3Pv/BRqYipUMbN9JSvpr5OeSL+5pMQGuOlp8SLx5r12GbEcuaU08XpECI5BeHMD3IelLhMomvIVicC072SXF5U3mjW4viSfNUYivKrj1xfIJqEluhUcvZzXIvUO9ctep+TL6cfAczCuHNEMDloTSCgaK8f9WnyiiglwxOyoVe3EkI11AclW6gOSHqRZVL3E/SLPDQw7qgtsJkCJtuVnP5O+kFR+Iq0xHU6S8gRDXlwAIjmJnwT/phg9WDrgfUJvt2SHH3ArBdBc2pYRtfrZl7m6WtEk6Wu4zAk2HvV8eOEscqMuWTWWKfB9npY1q+e9LulQGJe1hEs7MtbL+zGqZmBLjeFQ7+UWh+hSqO33gTbUOe4nzCyGa4016tWq2k4B7nO0+DWkGREk33nilh0iTtoTJliv2PcOxWd1XAE6yJ/SfYwDvJvvyQL8yqOP/T7hc/Bq7qngOAY39KCYB2BbHnKiWE6hrYPaiDJuG6du/V6q6jFdkTcpMJwmKq3gtb+49x+yOceSG62q5/aggE6v6MtsJJk7eyCbq4tbB1VCPbFmmwLGjeOBEq2nRYQ4hz3dl/LT/ZaSD+rx8YQtL/g1N/9FuMw9SlXJ0tb2T+j2YkAwGzxt5FDHHnVdtI3vALT8AtH0nw8VXEyIETbfWNto4JFTpFvGRxlu13T7iPCFfG1KKbI5IuMqRdTzUiYDvHrgHcJ7If48FB2b79YLf8AcaCe6C3ST6leESO1SaZ+q6LwCYHjI85uuZlrLkGpTsTOnUP0uUW7E8bEc06SQr1Pg2H8meLw5q1RB1uAgghzQ2Y0ie0CSWz4C61+PxbWQNLiSdrSBe5vsvnHQX6PhsS6tXrtjQQyGOku1iSQNiA08OJ5LfV89wVV2ptbgIApvM38BxK83q8V5dS4N3S5KhTMpWz+mX9bPZgCOMTMzz7l7jXtbpYXAvAh5F2gixJd3lZehh2OzFtET1RrgQZBLSZ2iR6beq0OJoUh1rjVglzmxpeY7QIOqOTR6qzxxjVEo5ZTuxZXhwEOFzAmQSB+lcWHjCV1GE3F7Tbv2+BTmhhWOqMaHtcDpaLm+3DeLJTmWHLaj2xsSOyIAi1hwsStOOW9GfJHaz6HlzooUv8ALp/ZClUqJU/FdRgqBfqc5wpmNzch58ABI9Ez7LgHDYgEeBEhUtGhXVAzqYndW02N4qhz+2W8mg+pcP8AiouKfkS67DFlYDZRqV53S01F51vel0D+rtQcKwHBT6+UtNZRNZHSBZBnrPNQc9yA+mLvpyGlj+pEOGLI3CsGObySs4wLw4oIaPYZZa4Y1+mu5NXJP9IHNeo6Ed6z8n0JmaUy0O1tLTcEGQRzBCJZiARIXy3JjiG0WN2LWgaQLDkL8Uc7GYgbyfL5LBLoF2Zy6tcuLPo+vvVNWuGiXPaBtewnlcrAYfM2t9qmSf23D3KjO8X9Ja1pJaGO1ts09oAgTqnaSk/QSvnYP6qCjffx8Rr+kGPpOw1ZratMk03gAObJMERvzsvlVPL6rnANawEk7m/OTf8AMpVXzHEUyWNfpYCQ0hrRImQZj4ISji673y19Qu5gmbH8T6rVi6aWNPdGPL1UcjWzNTSyCteXtb4D3yB+ZV7MuYB26rbby+B/u/N1lq2XVyHPc18AFxJdJtuqcsy99ckNDbblxRcLTbnt89xVkppKPz/BrmUcGJNStTmbX5AEeyTN54cF79Py1hP9JN+DXHjP1eIjzSqp0UqaS4up7GGgG8TsUB0fyg13Oa5xYBvYTPnsp1jcXLW6XzwU1ZFJRUFb+eR7i8/wWnSxr5dALgyLbO3dMkSgX9IKfWl1NlUUtQIpjS1oaL6eIjhsmjOi2FZd9c2vd7APistUoaK72gtc25BBa4EcIgkT3Sji9KdqN/k7L60acq/A1xPS13WvqdW4F8kjrCd3E7EQLGPIdyuwvSfDkaalGTPtaRN3F0SzSY4eHksvXEk+e/8AFe4XDh25ha1jgomT1Z6jc08wy2o32i08JJkXO2sGLW3XYTL2va17MSNXaJaXTvIgFpNtuH4YrE4PSJBDvJQZhHEAtH57kuiPKZT1pXujaZhlFQAyabpIj2QZMgASGme0eaR4vLKrb9W/xAJvedhCUjFV6dg97fMwrW5zXH6c+IHxhMoNcMWWaL5TND0IJdj6DYM6iYdFoY+/hHwTXHvqtq1g3Tp60uLSJDnNcQ2d7Wv5LGjPapcHGCWzG/GJmZ5BH4HFuqyRT43IIFzxtEnyU5Ym5an4oeGZadK8mhw2JIqMe6gx7hUNSWkBznRIbfZrTBiyU4xrXvc+o5we4yXNiAOJjnK8AeDp6wzydefBTmpyaedo+C5Qp2gud7DTE5nTfh6dLtF1NsSSJJgggbbdnyTfC51hnNa0PAgNEEEcIi4iyyHWcTT53Ecd/ggqjGxYubc7zxRURvWaNPhmNOMe9rpkG4dIIho2nn8E1qFZfo/iGMqkl4hw0iTEElsDzIWiqVFSKDGVo8c9VuKg56gXqlAciZcol6qc5QJRoVyJueq3OUHKBKNCORJzlAvUCVEuTKIjkWdYVyq1jkvEaBr9zU4DHVS1rnta18XAuPIq7G56KTddQwPzYDivnGQ5y+iRLgGTJESXRwtcbojpBmQqv7NTWxzWksc2AwixAknvM9+6wvDFvdGpdW1DZ7h+b9MarpFMtaNRhzQC4jgHB23oeSR1OkWIN+sJtH1YkRHZgd8oGowknbj7uAhUafz8vcrRxxS4Mk82STtsuqYl77OJMxx3gQJ5+K1GQdGyaba30gM1iY0ExfnIWTp+0D38F9MyORhcOZAYBL55SbD3rP1c3GP0lukgpSbkeUejTP0sY+/KmwT4F0yjsN0IoUxq14ntXOlzGb8DAspZZjaVXrW03kPJ7JcbCzQCDHJkSORPetJjH9WGVKlSzB2t+2Y5bHz5ryZ5cidWepHHB70IqWQ4MuDdFd55OrP+5ydUuiWCbDvorCTEyS4yTb2jdJsr6T4SpVqUYFN1QkNdzkBtjO9trfctZimU6dFrnvOmnpM84lJJ5E6bYyWN7qgKhleFDtLcJQB0td/ZtmHOLReN5GyG6cUGDLKxaym2dAhgFu22QSOK9ybpFUr13uZhyaQHtAAEEeO5M7C686b0mMyyqGTDnNJncdoW7tkYX6iTEyVoZ8jw9FpxrAQCDqkEW2fw8kweygTDsMw97Tp+HzQeF/v7P3vsvRlctaC0N1XknlO9+C9nsvseckrf3LsJk+Fq2FOoz9+R7yhzk9Jtm1qje5zAfgE3ydwc4EWsRAS7HV6bSGkku3MHhPFBSY7jGrF+KyZzhaqxwHNpb80I7LasW6s+DvmFomXY8tuIET5bpXUY2YkbbQPinUmTlBA3RvIDWxtHD1GuDXuJdpgnS0FzrzawN/cdlqsdl1NlaqxjA1ratRrQBEAOIAELzoS2Mzwlo/o632HIjPWjr687ddUJ7u05BybnXt/J0YKMfyBNwQm0z4/NQrUCI7XqPlCjg8Wxzi0Fw5SSNXOB9yZV6M7mI4/NNYasUuY7k34IepTtGn0PzTSlpeJa4OFxbuQ1ZsHhHjF0UxWgHBljKjXOsAeI5iBfzT+o5ZzNrU3Oi4j3EJP/ADxWhzdZOqBubR9WOapER5NOzNsShjiG6tE9rz5A2Ox3Hv5LJ1M3cSLlwbZuo9qZ3BA3tF5t4ofE40vOo7/jNuXFOK8qNsQolZfLc4LAQ4uNoa3x2JJMwIAWhwtfWxruYBttPFFBUkyZUHKTnKBKY5kSoFLs2xz2HSIAI33J99uKowOagNh7iTPEcPFHUTbQ2XqTPzu9mW8V6u1IXYWCm368c7GfJePoum1/jHeq2uHFSZUifmVDcUspVyIEbGYv+R5LhWmzhImbADxv81TcmeKkXfn8ETrJsjUI5hbt4JweGpzGpp+J3WCoe2PFfR6WXGrh8GBAhgHHYuAta+6ydW60385NvSK1I2WVZTTp0xTa0d54k/WJ5pP0mOsUqZdAc0H36fkn9B5lLM0y3rKtEAxp0A73BfJ8+yvGi/qtnrtbUiip0OP0sPbSik3qtJGiIbo1WJngU06WOb1TGEwC58d4aXn0gT5LTU3FIekmA1hjQQI1G4n2naTsRwefcjqurBFVsPcmwrKdGm1oAAaPhJKzv8osfQ8QBzpepK1VBmlobyAHosv/ACksAwNU/WdSnycnxr6kRnwz4/hv76z977L1pstw4IFt1mMH/fWfvfZethlwgDwXsV9K+xhhy/uW/R6bHw0iYkjyKzWBytr6ri5zDOqDqaTM2ETK1VbCHV1tvZPEztp28z6L5dl7ia9J3E1Wn/eCp4Y3FobPLTJbG6dgwxj2tPIe8fNAVMoG4sRfxTRmELWvmN28uDp5cgF5iGEtIEyeW66P7BpL6uDuh3/meE/y632Hq7PRNeuP+8/7ZVHRPs5lhZ4U62/ex/zVmc1f6zW/zn/aKaO8/wAfyI9o/n+Cuhgmk6tiI/BX5tT1M08HOAPhv9wUKTdX6RHgqswzBlN1MPntOIEcNrn3eqKT1MLaUTzLcD1ev08eRQWbYMv47bePem5pO1F2q28fBD1BK6HDBNLgR5wwjDuBuYHxCyYMFbPpDTIovmNuHiFjQ6FfG/pMmdVI6o8kydz+eC81cF68LxrCdgnIkqJ7QvaR3xfda/K67Xt0j2x7doBNrzEX+ayHVwbnwPDzR1bM6nV9TYNAAsACY5ndFMeLrk0dXFUxPaBjgCCfRU4TG06nsm8TpPtLKsIG7Z9fcictxL2uJaC4aTqAnY8bcZ4ptQdZ7i6TtRa93szAmeXZ/PJDU2Dif4+G6ILKjyXESQBJ5iI1W3shiN780ojIOAXL3V4LlwCIaeW6k1qIOEcrjlxAJ1A32gyfDuSuQ2hgLW33XOEeKvZQcCZYfQ+inSpXEsMTyO0G3wROopww7Te8r6vkzv6DCfsN+21fMsQwam6WFsSttlub02UsO0m7GtDrG0OBKxdZFySo3dG1G7NzQ3U6p/pqfiz7TkhodJKE+2Pf8ldX6Q0BVpu6wRNMnuEuleU8cr4PTU4+TcNKX5ubj9n/AJtQLOlOE/xmeqozXPKJLS14Mgcf12H4XSaX4GTVmu1LK/ymO/qLv26f2kaekeH/AMVn+pvzSTp/mFOrgnBj2k62GAQSRN4Cpi/eiWSNRZ8uwbv64z9/7L1scERZYrCOAxTSbAap7pa7f1T7DZqwAXHqvarZHmxe7+5psXWGgib6D8Qvk+Xf2tL/ADGfaC3VfNqZI7Yu1w3Ft9/T3hYfA0yKlNxEAPaT4AglDBFpMHUStxPodTES57e/7/4rxhultXH0gXO1tM94+sT8l6M0p/XHqkjH6Csp/WEZNiAMxw7nEAaKtyYHsOG5Q+bYpvX1jqEGq/iPrFJcyrNdVpw8RpIkHYngllWiZdEm5veD5qkIb37Ep5Nq9zXYXHs+sPUJfn9QOdSgg3d8As61o5q9z2tuXcrJ9G4jyWqN+2u0tIDhMDj4oWpUAMEifFfPfpBDiWmF1TEPduSUI4qOl1CfY2fSKqHUakEbD4hYhrhN1YwPgxqjj+eKa5DhcG4xiuvZuddOC2OA06HGUyWiJKcnklYopvhwMeSKe76xHdHNGZxSwgLfogxJ31mto8g0MaO+5KWmm47Nd6FdtLcXeOx66p4HxCg8gkm355LwU3bQVJtB52aSmqgO2VvnyUwTYiG7D0+Ksp4WqZAY4wJIAkwNyQOA5quCOPvHzRs6jqby02PPwM9ym9gteDy+fJVQSVY2gd+7kfuQZxSSuXjmL1EAdWc4AwVQMQ4cfcuXKcEmWm2mTbiDxVrcSOJ+K5cjSO1MLweODHahcxEOki/cmY6QOH/Sp+i5cozxxb3LQm0tgij0vcB/d6J8QiW9Mgd8JRPkB/xXLlN4Mfgos0/Jf/4uoixwNH3H4tVj+lVB0H6FTiO6fKy5cpPBCuP9sos07/pFtPpFhY/uTbfs/JFV8/whBDsJYAEwQLGI2jiQuXKXpRv+2U9WVf0ZfM24Z1Vz2M0tOmGwTFgN55gpbiX0WRLRfiB+K5ctmGT2iY8qSTZxr4cHw/VPKeaiMfh49k/6R81y5atJn1sqfmFHgw/6W/NeHM6X+H7h81y5HSga2QdmLP8AD+CqOPH1T6j5Lly6gamcMcBsz/d+C45j+p7/AMFy5cdqZ7/OdvZH5hQqZk42hseH4rly6kdrZWMYfqs/0hTGY1B9X/S1cuXHJsk3M6om4v8Aqs+Sn/O1eCNdjuAGieUw1erkNK8DKUvIM5xNyZKj1jhsY8Fy5cjmeh5I3PqqiuXLkBnoUYXLkQHmlcuXLgUf/9k=",
                17.3950,
                78.3968,
                "Qutb Shahi Tombs",
              ),
            ),
            SizedBox(width: 10.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes(
                "https://www.holidify.com/images/cmsuploads/compressed/1290_20190227143657.jpg",
                17.4239,
                78.4738,
                "Hussain Sagar",
              ),
            ),
            SizedBox(width: 10.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes(
                "https://arunachalobserver.org/wp-content/uploads/2017/08/Ramoji-Movie-Magic-810x540.jpg",
                17.2543,
                78.6808,
                "Ramoji Film City",
              ),
            ),
            SizedBox(width: 10.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes(
                "https://www.mapsofindia.com/ci-moi-images/my-india/NTR-Gardens-Hyderabad-665x444.jpg",
                17.4125,
                78.4688,
                "NTR Gardens",
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _boxes(String _image, double lat, double long, String placeName) {
    return GestureDetector(
      onTap: () {
        _gotoLocation(lat, long);
      },
      child: Container(
        child: new FittedBox(
          child: Material(
              color: Colors.white,
              elevation: 14.0,
              borderRadius: BorderRadius.circular(24.0),
              shadowColor: Color(0x802196F3),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    width: 180,
                    height: 200,
                    child: ClipRRect(
                      borderRadius: new BorderRadius.circular(24.0),
                      child: Image(
                        fit: BoxFit.fill,
                        image: NetworkImage(_image),
                      ),
                    ),
                  ),
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: myDetailsContainer1(placeName),
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }

  Widget myDetailsContainer1(String placeName) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Container(
            child: Text(
              placeName,
              style: TextStyle(
                  color: Color(0xff6200ee),
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildGoogleMap(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition:
            CameraPosition(target: LatLng(17.4554, 78.5008), zoom: 12),
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
        markers: {
          vikrampuriMarker1,
          birlaMandirMarker,
          charminarMarker,
          golcondaMarker,
          salarJungMuseumMarker,
          nehruZoologicalParkMarker,
          ntrGardensMarker,
        },
      ),
    );
  }

  Future<void> _gotoLocation(double lat, double long) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
      target: LatLng(lat, long),
      zoom: 15,
      tilt: 50.0,
      bearing: 45.0,
    )));
  }
}

Marker golcondaMarker = Marker(
  markerId: MarkerId('GolcondaFort'),
  position: LatLng(17.3833, 78.4011),
  infoWindow: InfoWindow(title: 'Golconda Fort'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueBlue,
  ),
);

Marker salarJungMuseumMarker = Marker(
  markerId: MarkerId('SalarJungMuseum'),
  position: LatLng(17.3713, 78.4804),
  infoWindow: InfoWindow(title: 'Salar Jung Museum'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueBlue,
  ),
);
Marker nehruZoologicalParkMarker = Marker(
  markerId: MarkerId('NehruZoologicalPark'),
  position: LatLng(17.3507, 78.4513),
  infoWindow: InfoWindow(title: 'Nehru Zoological Park'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueBlue,
  ),
);

Marker vikrampuriMarker1 = Marker(
  markerId: MarkerId('Vikrampuri'),
  position: LatLng(17.4554, 78.5008),
  infoWindow: InfoWindow(title: 'VikramPuri'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueRed,
  ),
);
Marker birlaMandirMarker = Marker(
  markerId: MarkerId('BirlaMandir'),
  position: LatLng(17.4062, 78.4691),
  infoWindow: InfoWindow(title: 'Birla Mandir'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueBlue,
  ),
);
Marker charminarMarker = Marker(
  markerId: MarkerId('charminar'),
  position: LatLng(17.3616, 78.4747),
  infoWindow: InfoWindow(title: 'Charminar'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueBlue,
  ),
);
Marker ntrGardensMarker = Marker(
  markerId: MarkerId('ntrGardens'),
  position: LatLng(17.4125, 78.4688),
  infoWindow: InfoWindow(title: 'NTR Gardens'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueBlue,
  ),
);
Marker qutbShahiTombs = Marker(
  markerId: MarkerId('qutbShahiTombs'),
  position: LatLng(17.3950, 78.3968),
  infoWindow: InfoWindow(title: 'Qutb Shahi Tombs'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueBlue,
  ),
);

Marker hussainSagar = Marker(
  markerId: MarkerId('hussainSagar'),
  position: LatLng(17.4239, 78.4738),
  infoWindow: InfoWindow(title: 'Hussain Sagar'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueBlue,
  ),
);

Marker ramojiFilmCity = Marker(
  markerId: MarkerId('ramojiFilmCity'),
  position: LatLng(17.2543, 78.6808),
  infoWindow: InfoWindow(title: 'Ramoji Film City'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueBlue,
  ),
);

Marker meccaMasjid = Marker(
  markerId: MarkerId('meccaMasjid'),
  position: LatLng(17.3604, 78.4736),
  infoWindow: InfoWindow(title: 'Mecca Masjid'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueBlue,
  ),
);
