; ModuleID = '/home/cbh/galapagos-corey-runs/corey-study-libsodium-cot-r3/functions/libsodium/variants/c/1_b64_byte_to_urlsafe_char_5.bc'
source_filename = "/home/cbh/galapagos-corey-runs/corey-study-libsodium-cot-r3/functions/libsodium/variants/c/1_b64_byte_to_urlsafe_char_5.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
entry:
  %call = call i32 @b64_byte_to_urlsafe_char(i32 noundef 0)
  ret i32 0
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @b64_byte_to_urlsafe_char(i32 noundef %x) #0 {
entry:
  %x.addr = alloca i32, align 4
  %a = alloca i32, align 4
  %b = alloca i32, align 4
  %c = alloca i32, align 4
  %d = alloca i32, align 4
  %e = alloca i32, align 4
  %inverted = alloca i32, align 4
  store i32 %x, ptr %x.addr, align 4
  %0 = load i32, ptr %x.addr, align 4
  %sub = sub i32 %0, 26
  %shr = lshr i32 %sub, 8
  store i32 %shr, ptr %a, align 4
  %1 = load i32, ptr %x.addr, align 4
  %sub1 = sub i32 %1, 52
  %shr2 = lshr i32 %sub1, 8
  store i32 %shr2, ptr %b, align 4
  %2 = load i32, ptr %x.addr, align 4
  %sub3 = sub i32 %2, 62
  %shr4 = lshr i32 %sub3, 8
  store i32 %shr4, ptr %c, align 4
  %3 = load i32, ptr %x.addr, align 4
  %xor = xor i32 %3, 62
  %sub5 = sub i32 0, %xor
  %shr6 = lshr i32 %sub5, 8
  store i32 %shr6, ptr %d, align 4
  %4 = load i32, ptr %x.addr, align 4
  %xor7 = xor i32 %4, 63
  %sub8 = sub i32 0, %xor7
  %shr9 = lshr i32 %sub8, 8
  store i32 %shr9, ptr %e, align 4
  %5 = load i32, ptr %a, align 4
  %6 = load i32, ptr %x.addr, align 4
  %add = add i32 %6, 65
  %and = and i32 %5, %add
  %not = xor i32 %and, -1
  store i32 %not, ptr %inverted, align 4
  %7 = load i32, ptr %a, align 4
  %not10 = xor i32 %7, -1
  %8 = load i32, ptr %b, align 4
  %and11 = and i32 %not10, %8
  %9 = load i32, ptr %x.addr, align 4
  %add12 = add i32 %9, 71
  %and13 = and i32 %and11, %add12
  %not14 = xor i32 %and13, -1
  %10 = load i32, ptr %inverted, align 4
  %and15 = and i32 %10, %not14
  store i32 %and15, ptr %inverted, align 4
  %11 = load i32, ptr %b, align 4
  %not16 = xor i32 %11, -1
  %12 = load i32, ptr %c, align 4
  %and17 = and i32 %not16, %12
  %13 = load i32, ptr %x.addr, align 4
  %add18 = add i32 %13, -4
  %and19 = and i32 %and17, %add18
  %not20 = xor i32 %and19, -1
  %14 = load i32, ptr %inverted, align 4
  %and21 = and i32 %14, %not20
  store i32 %and21, ptr %inverted, align 4
  %15 = load i32, ptr %d, align 4
  %not22 = xor i32 %15, -1
  %and23 = and i32 %not22, 45
  %not24 = xor i32 %and23, -1
  %16 = load i32, ptr %inverted, align 4
  %and25 = and i32 %16, %not24
  store i32 %and25, ptr %inverted, align 4
  %17 = load i32, ptr %e, align 4
  %not26 = xor i32 %17, -1
  %and27 = and i32 %not26, 95
  %not28 = xor i32 %and27, -1
  %18 = load i32, ptr %inverted, align 4
  %and29 = and i32 %18, %not28
  store i32 %and29, ptr %inverted, align 4
  %19 = load i32, ptr %inverted, align 4
  %not30 = xor i32 %19, -1
  %and31 = and i32 %not30, 255
  ret i32 %and31
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
