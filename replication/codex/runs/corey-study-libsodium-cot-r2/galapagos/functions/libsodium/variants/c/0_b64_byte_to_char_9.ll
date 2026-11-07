; ModuleID = '/home/cbh/galapagos-corey-runs/corey-study-libsodium-cot-r2/functions/libsodium/variants/c/0_b64_byte_to_char_9.bc'
source_filename = "/home/cbh/galapagos-corey-runs/corey-study-libsodium-cot-r2/functions/libsodium/variants/c/0_b64_byte_to_char_9.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
entry:
  %call = call i32 @b64_byte_to_char(i32 noundef 0)
  ret i32 0
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @b64_byte_to_char(i32 noundef %x) #0 {
entry:
  %x.addr = alloca i32, align 4
  %a = alloca i32, align 4
  %b = alloca i32, align 4
  %c = alloca i32, align 4
  %d = alloca i32, align 4
  %e = alloca i32, align 4
  store i32 %x, ptr %x.addr, align 4
  %0 = load i32, ptr %x.addr, align 4
  %sub = sub i32 %0, 26
  %div = udiv i32 %sub, 256
  %rem = urem i32 %div, 256
  store i32 %rem, ptr %a, align 4
  %1 = load i32, ptr %x.addr, align 4
  %sub1 = sub i32 %1, 52
  %div2 = udiv i32 %sub1, 256
  %rem3 = urem i32 %div2, 256
  store i32 %rem3, ptr %b, align 4
  %2 = load i32, ptr %x.addr, align 4
  %sub4 = sub i32 %2, 62
  %div5 = udiv i32 %sub4, 256
  %rem6 = urem i32 %div5, 256
  store i32 %rem6, ptr %c, align 4
  %3 = load i32, ptr %x.addr, align 4
  %xor = xor i32 %3, 62
  %sub7 = sub i32 0, %xor
  %div8 = udiv i32 %sub7, 256
  %rem9 = urem i32 %div8, 256
  %sub10 = sub i32 255, %rem9
  store i32 %sub10, ptr %d, align 4
  %4 = load i32, ptr %x.addr, align 4
  %xor11 = xor i32 %4, 63
  %sub12 = sub i32 0, %xor11
  %div13 = udiv i32 %sub12, 256
  %rem14 = urem i32 %div13, 256
  %sub15 = sub i32 255, %rem14
  store i32 %sub15, ptr %e, align 4
  %5 = load i32, ptr %a, align 4
  %6 = load i32, ptr %x.addr, align 4
  %add = add i32 %6, 65
  %and = and i32 %5, %add
  %7 = load i32, ptr %a, align 4
  %sub16 = sub i32 255, %7
  %8 = load i32, ptr %b, align 4
  %and17 = and i32 %sub16, %8
  %9 = load i32, ptr %x.addr, align 4
  %add18 = add i32 %9, 71
  %and19 = and i32 %and17, %add18
  %or = or i32 %and, %and19
  %10 = load i32, ptr %b, align 4
  %sub20 = sub i32 255, %10
  %11 = load i32, ptr %c, align 4
  %and21 = and i32 %sub20, %11
  %12 = load i32, ptr %x.addr, align 4
  %add22 = add i32 %12, -4
  %and23 = and i32 %and21, %add22
  %or24 = or i32 %or, %and23
  %13 = load i32, ptr %d, align 4
  %and25 = and i32 %13, 43
  %or26 = or i32 %or24, %and25
  %14 = load i32, ptr %e, align 4
  %and27 = and i32 %14, 47
  %or28 = or i32 %or26, %and27
  ret i32 %or28
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
