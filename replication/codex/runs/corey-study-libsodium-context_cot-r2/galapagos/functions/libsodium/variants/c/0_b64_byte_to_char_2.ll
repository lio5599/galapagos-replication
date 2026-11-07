; ModuleID = '/home/cbh/galapagos-corey-runs/corey-study-libsodium-context_cot-r2/functions/libsodium/variants/c/0_b64_byte_to_char_2.bc'
source_filename = "/home/cbh/galapagos-corey-runs/corey-study-libsodium-context_cot-r2/functions/libsodium/variants/c/0_b64_byte_to_char_2.c"
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
  %na = alloca i32, align 4
  %b = alloca i32, align 4
  %nb = alloca i32, align 4
  %c = alloca i32, align 4
  %nd = alloca i32, align 4
  %ne = alloca i32, align 4
  store i32 %x, ptr %x.addr, align 4
  %0 = load i32, ptr %x.addr, align 4
  %sub = sub i32 %0, 26
  %shr = lshr i32 %sub, 8
  %and = and i32 %shr, 255
  store i32 %and, ptr %a, align 4
  %1 = load i32, ptr %x.addr, align 4
  %sub1 = sub i32 %1, 26
  %shr2 = lshr i32 %sub1, 8
  %not = xor i32 %shr2, -1
  %and3 = and i32 %not, 255
  store i32 %and3, ptr %na, align 4
  %2 = load i32, ptr %x.addr, align 4
  %sub4 = sub i32 %2, 52
  %shr5 = lshr i32 %sub4, 8
  %and6 = and i32 %shr5, 255
  store i32 %and6, ptr %b, align 4
  %3 = load i32, ptr %x.addr, align 4
  %sub7 = sub i32 %3, 52
  %shr8 = lshr i32 %sub7, 8
  %not9 = xor i32 %shr8, -1
  %and10 = and i32 %not9, 255
  store i32 %and10, ptr %nb, align 4
  %4 = load i32, ptr %x.addr, align 4
  %sub11 = sub i32 %4, 62
  %shr12 = lshr i32 %sub11, 8
  %and13 = and i32 %shr12, 255
  store i32 %and13, ptr %c, align 4
  %5 = load i32, ptr %x.addr, align 4
  %xor = xor i32 %5, 62
  %sub14 = sub i32 0, %xor
  %shr15 = lshr i32 %sub14, 8
  %not16 = xor i32 %shr15, -1
  %and17 = and i32 %not16, 255
  store i32 %and17, ptr %nd, align 4
  %6 = load i32, ptr %x.addr, align 4
  %xor18 = xor i32 %6, 63
  %sub19 = sub i32 0, %xor18
  %shr20 = lshr i32 %sub19, 8
  %not21 = xor i32 %shr20, -1
  %and22 = and i32 %not21, 255
  store i32 %and22, ptr %ne, align 4
  %7 = load i32, ptr %a, align 4
  %8 = load i32, ptr %x.addr, align 4
  %add = add i32 %8, 65
  %and23 = and i32 %7, %add
  %9 = load i32, ptr %na, align 4
  %10 = load i32, ptr %b, align 4
  %and24 = and i32 %9, %10
  %11 = load i32, ptr %x.addr, align 4
  %add25 = add i32 %11, 71
  %and26 = and i32 %and24, %add25
  %or = or i32 %and23, %and26
  %12 = load i32, ptr %nb, align 4
  %13 = load i32, ptr %c, align 4
  %and27 = and i32 %12, %13
  %14 = load i32, ptr %x.addr, align 4
  %add28 = add i32 %14, -4
  %and29 = and i32 %and27, %add28
  %or30 = or i32 %or, %and29
  %15 = load i32, ptr %nd, align 4
  %and31 = and i32 %15, 43
  %or32 = or i32 %or30, %and31
  %16 = load i32, ptr %ne, align 4
  %and33 = and i32 %16, 47
  %or34 = or i32 %or32, %and33
  ret i32 %or34
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
