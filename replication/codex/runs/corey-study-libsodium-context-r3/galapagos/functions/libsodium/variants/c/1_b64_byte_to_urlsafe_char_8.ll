; ModuleID = '/home/cbh/galapagos-corey-runs/corey-study-libsodium-context-r3/functions/libsodium/variants/c/1_b64_byte_to_urlsafe_char_8.bc'
source_filename = "/home/cbh/galapagos-corey-runs/corey-study-libsodium-context-r3/functions/libsodium/variants/c/1_b64_byte_to_urlsafe_char_8.c"
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
  %result = alloca i32, align 4
  %term = alloca i32, align 4
  store i32 %x, ptr %x.addr, align 4
  %0 = load i32, ptr %x.addr, align 4
  %sub = sub i32 %0, 26
  %shr = lshr i32 %sub, 8
  %and = and i32 %shr, 255
  store i32 %and, ptr %a, align 4
  %1 = load i32, ptr %x.addr, align 4
  %sub1 = sub i32 %1, 52
  %shr2 = lshr i32 %sub1, 8
  %and3 = and i32 %shr2, 255
  store i32 %and3, ptr %b, align 4
  %2 = load i32, ptr %x.addr, align 4
  %sub4 = sub i32 %2, 62
  %shr5 = lshr i32 %sub4, 8
  %and6 = and i32 %shr5, 255
  store i32 %and6, ptr %c, align 4
  %3 = load i32, ptr %a, align 4
  %4 = load i32, ptr %x.addr, align 4
  %add = add i32 %4, 65
  %and7 = and i32 %3, %add
  store i32 %and7, ptr %result, align 4
  %5 = load i32, ptr %a, align 4
  %not = xor i32 %5, -1
  %6 = load i32, ptr %b, align 4
  %and8 = and i32 %not, %6
  %7 = load i32, ptr %x.addr, align 4
  %add9 = add i32 %7, 71
  %and10 = and i32 %and8, %add9
  store i32 %and10, ptr %term, align 4
  %8 = load i32, ptr %result, align 4
  %9 = load i32, ptr %term, align 4
  %add11 = add i32 %8, %9
  %10 = load i32, ptr %result, align 4
  %11 = load i32, ptr %term, align 4
  %and12 = and i32 %10, %11
  %sub13 = sub i32 %add11, %and12
  store i32 %sub13, ptr %result, align 4
  %12 = load i32, ptr %b, align 4
  %not14 = xor i32 %12, -1
  %13 = load i32, ptr %c, align 4
  %and15 = and i32 %not14, %13
  %14 = load i32, ptr %x.addr, align 4
  %add16 = add i32 %14, -4
  %and17 = and i32 %and15, %add16
  store i32 %and17, ptr %term, align 4
  %15 = load i32, ptr %result, align 4
  %16 = load i32, ptr %term, align 4
  %add18 = add i32 %15, %16
  %17 = load i32, ptr %result, align 4
  %18 = load i32, ptr %term, align 4
  %and19 = and i32 %17, %18
  %sub20 = sub i32 %add18, %and19
  store i32 %sub20, ptr %result, align 4
  %19 = load i32, ptr %x.addr, align 4
  %xor = xor i32 %19, 62
  %sub21 = sub i32 0, %xor
  %shr22 = lshr i32 %sub21, 8
  %not23 = xor i32 %shr22, -1
  %and24 = and i32 %not23, 255
  %and25 = and i32 %and24, 45
  store i32 %and25, ptr %term, align 4
  %20 = load i32, ptr %result, align 4
  %21 = load i32, ptr %term, align 4
  %add26 = add i32 %20, %21
  %22 = load i32, ptr %result, align 4
  %23 = load i32, ptr %term, align 4
  %and27 = and i32 %22, %23
  %sub28 = sub i32 %add26, %and27
  store i32 %sub28, ptr %result, align 4
  %24 = load i32, ptr %x.addr, align 4
  %xor29 = xor i32 %24, 63
  %sub30 = sub i32 0, %xor29
  %shr31 = lshr i32 %sub30, 8
  %not32 = xor i32 %shr31, -1
  %and33 = and i32 %not32, 255
  %and34 = and i32 %and33, 95
  store i32 %and34, ptr %term, align 4
  %25 = load i32, ptr %result, align 4
  %26 = load i32, ptr %term, align 4
  %add35 = add i32 %25, %26
  %27 = load i32, ptr %result, align 4
  %28 = load i32, ptr %term, align 4
  %and36 = and i32 %27, %28
  %sub37 = sub i32 %add35, %and36
  store i32 %sub37, ptr %result, align 4
  %29 = load i32, ptr %result, align 4
  ret i32 %29
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
