; ModuleID = '/home/liolsen/galapagos-replication/functions/libsodium/variants/c/0_b64_byte_to_char_5.bc'
source_filename = "/home/liolsen/galapagos-replication/functions/libsodium/variants/c/0_b64_byte_to_char_5.c"
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
  %t62 = alloca i32, align 4
  %t63 = alloca i32, align 4
  %m26 = alloca i32, align 4
  %m52 = alloca i32, align 4
  %m62 = alloca i32, align 4
  %res = alloca i32, align 4
  store i32 %x, ptr %x.addr, align 4
  %0 = load i32, ptr %x.addr, align 4
  %xor = xor i32 %0, 62
  %not = xor i32 %xor, -1
  %add = add i32 %not, 1
  store i32 %add, ptr %t62, align 4
  %1 = load i32, ptr %x.addr, align 4
  %xor1 = xor i32 %1, 63
  %not2 = xor i32 %xor1, -1
  %add3 = add i32 %not2, 1
  store i32 %add3, ptr %t63, align 4
  %2 = load i32, ptr %x.addr, align 4
  %sub = sub i32 %2, 26
  %shr = lshr i32 %sub, 8
  %and = and i32 %shr, 255
  store i32 %and, ptr %m26, align 4
  %3 = load i32, ptr %x.addr, align 4
  %sub4 = sub i32 %3, 52
  %shr5 = lshr i32 %sub4, 8
  %and6 = and i32 %shr5, 255
  store i32 %and6, ptr %m52, align 4
  %4 = load i32, ptr %x.addr, align 4
  %sub7 = sub i32 %4, 62
  %shr8 = lshr i32 %sub7, 8
  %and9 = and i32 %shr8, 255
  store i32 %and9, ptr %m62, align 4
  store i32 0, ptr %res, align 4
  %5 = load i32, ptr %t63, align 4
  %shr10 = lshr i32 %5, 8
  %and11 = and i32 %shr10, 255
  %xor12 = xor i32 %and11, 255
  %and13 = and i32 %xor12, 47
  %6 = load i32, ptr %res, align 4
  %or = or i32 %6, %and13
  store i32 %or, ptr %res, align 4
  %7 = load i32, ptr %t62, align 4
  %shr14 = lshr i32 %7, 8
  %and15 = and i32 %shr14, 255
  %xor16 = xor i32 %and15, 255
  %and17 = and i32 %xor16, 43
  %8 = load i32, ptr %res, align 4
  %or18 = or i32 %8, %and17
  store i32 %or18, ptr %res, align 4
  %9 = load i32, ptr %m52, align 4
  %xor19 = xor i32 %9, 255
  %10 = load i32, ptr %m62, align 4
  %and20 = and i32 %xor19, %10
  %11 = load i32, ptr %x.addr, align 4
  %add21 = add i32 %11, -4
  %and22 = and i32 %and20, %add21
  %12 = load i32, ptr %res, align 4
  %or23 = or i32 %12, %and22
  store i32 %or23, ptr %res, align 4
  %13 = load i32, ptr %m26, align 4
  %xor24 = xor i32 %13, 255
  %14 = load i32, ptr %m52, align 4
  %and25 = and i32 %xor24, %14
  %15 = load i32, ptr %x.addr, align 4
  %add26 = add i32 %15, 71
  %and27 = and i32 %and25, %add26
  %16 = load i32, ptr %res, align 4
  %or28 = or i32 %16, %and27
  store i32 %or28, ptr %res, align 4
  %17 = load i32, ptr %m26, align 4
  %18 = load i32, ptr %x.addr, align 4
  %add29 = add i32 %18, 65
  %and30 = and i32 %17, %add29
  %19 = load i32, ptr %res, align 4
  %or31 = or i32 %19, %and30
  store i32 %or31, ptr %res, align 4
  %20 = load i32, ptr %res, align 4
  ret i32 %20
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
