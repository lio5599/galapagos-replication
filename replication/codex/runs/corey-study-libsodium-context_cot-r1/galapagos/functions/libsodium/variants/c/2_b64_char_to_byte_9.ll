; ModuleID = '/home/cbh/galapagos-corey-runs/corey-study-libsodium-context_cot-r1/functions/libsodium/variants/c/2_b64_char_to_byte_9.bc'
source_filename = "/home/cbh/galapagos-corey-runs/corey-study-libsodium-context_cot-r1/functions/libsodium/variants/c/2_b64_char_to_byte_9.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
entry:
  %call = call i32 @b64_char_to_byte(i32 noundef 0)
  ret i32 0
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @b64_char_to_byte(i32 noundef %c) #0 {
entry:
  %c.addr = alloca i32, align 4
  %u = alloca i32, align 4
  %a = alloca i32, align 4
  %b = alloca i32, align 4
  %d = alloca i32, align 4
  %p = alloca i32, align 4
  %s = alloca i32, align 4
  %x = alloca i32, align 4
  %z = alloca i32, align 4
  %n = alloca i32, align 4
  store i32 %c, ptr %c.addr, align 4
  %0 = load i32, ptr %c.addr, align 4
  store i32 %0, ptr %u, align 4
  %1 = load i32, ptr %u, align 4
  %sub = sub i32 %1, 65
  %div = udiv i32 %sub, 256
  %rem = urem i32 %div, 256
  %xor = xor i32 255, %rem
  %2 = load i32, ptr %u, align 4
  %sub1 = sub i32 90, %2
  %div2 = udiv i32 %sub1, 256
  %rem3 = urem i32 %div2, 256
  %xor4 = xor i32 255, %rem3
  %and = and i32 %xor, %xor4
  store i32 %and, ptr %a, align 4
  %3 = load i32, ptr %u, align 4
  %sub5 = sub i32 %3, 97
  %div6 = udiv i32 %sub5, 256
  %rem7 = urem i32 %div6, 256
  %xor8 = xor i32 255, %rem7
  %4 = load i32, ptr %u, align 4
  %sub9 = sub i32 122, %4
  %div10 = udiv i32 %sub9, 256
  %rem11 = urem i32 %div10, 256
  %xor12 = xor i32 255, %rem11
  %and13 = and i32 %xor8, %xor12
  store i32 %and13, ptr %b, align 4
  %5 = load i32, ptr %u, align 4
  %sub14 = sub i32 %5, 48
  %div15 = udiv i32 %sub14, 256
  %rem16 = urem i32 %div15, 256
  %xor17 = xor i32 255, %rem16
  %6 = load i32, ptr %u, align 4
  %sub18 = sub i32 57, %6
  %div19 = udiv i32 %sub18, 256
  %rem20 = urem i32 %div19, 256
  %xor21 = xor i32 255, %rem20
  %and22 = and i32 %xor17, %xor21
  store i32 %and22, ptr %d, align 4
  %7 = load i32, ptr %u, align 4
  %xor23 = xor i32 %7, 43
  %sub24 = sub i32 0, %xor23
  %div25 = udiv i32 %sub24, 256
  %rem26 = urem i32 %div25, 256
  %xor27 = xor i32 255, %rem26
  store i32 %xor27, ptr %p, align 4
  %8 = load i32, ptr %u, align 4
  %xor28 = xor i32 %8, 47
  %sub29 = sub i32 0, %xor28
  %div30 = udiv i32 %sub29, 256
  %rem31 = urem i32 %div30, 256
  %xor32 = xor i32 255, %rem31
  store i32 %xor32, ptr %s, align 4
  %9 = load i32, ptr %a, align 4
  %10 = load i32, ptr %u, align 4
  %sub33 = sub i32 %10, 65
  %and34 = and i32 %9, %sub33
  %11 = load i32, ptr %b, align 4
  %12 = load i32, ptr %u, align 4
  %sub35 = sub i32 %12, 97
  %add = add i32 %sub35, 26
  %and36 = and i32 %11, %add
  %or = or i32 %and34, %and36
  %13 = load i32, ptr %d, align 4
  %14 = load i32, ptr %u, align 4
  %sub37 = sub i32 %14, 48
  %add38 = add i32 %sub37, 52
  %and39 = and i32 %13, %add38
  %or40 = or i32 %or, %and39
  %15 = load i32, ptr %p, align 4
  %and41 = and i32 %15, 62
  %or42 = or i32 %or40, %and41
  %16 = load i32, ptr %s, align 4
  %and43 = and i32 %16, 63
  %or44 = or i32 %or42, %and43
  store i32 %or44, ptr %x, align 4
  %17 = load i32, ptr %x, align 4
  %sub45 = sub i32 0, %17
  %div46 = udiv i32 %sub45, 256
  %rem47 = urem i32 %div46, 256
  %xor48 = xor i32 255, %rem47
  store i32 %xor48, ptr %z, align 4
  %18 = load i32, ptr %u, align 4
  %xor49 = xor i32 %18, 65
  %sub50 = sub i32 0, %xor49
  %div51 = udiv i32 %sub50, 256
  %rem52 = urem i32 %div51, 256
  store i32 %rem52, ptr %n, align 4
  %19 = load i32, ptr %x, align 4
  %20 = load i32, ptr %z, align 4
  %21 = load i32, ptr %n, align 4
  %and53 = and i32 %20, %21
  %or54 = or i32 %19, %and53
  ret i32 %or54
}

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 2}
!4 = !{i32 7, !"frame-pointer", i32 2}
!5 = !{!"clang version 17.0.0 (git@github.com:llvm/llvm-project.git 1a7a00bdc99fa2b2ca19ecd2d1069991b3c1006b)"}
