; ModuleID = '/home/liolsen/galapagos-replication/functions/libsodium/variants/c/0_b64_byte_to_char_1.bc'
source_filename = "/home/liolsen/galapagos-replication/functions/libsodium/variants/c/0_b64_byte_to_char_1.c"
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
  %a = alloca i8, align 1
  %b = alloca i8, align 1
  %c = alloca i8, align 1
  %d = alloca i8, align 1
  %e = alloca i8, align 1
  %na = alloca i8, align 1
  %nb = alloca i8, align 1
  store i32 %x, ptr %x.addr, align 4
  %0 = load i32, ptr %x.addr, align 4
  %sub = sub i32 %0, 26
  %shr = lshr i32 %sub, 8
  %conv = trunc i32 %shr to i8
  store i8 %conv, ptr %a, align 1
  %1 = load i32, ptr %x.addr, align 4
  %sub1 = sub i32 %1, 52
  %shr2 = lshr i32 %sub1, 8
  %conv3 = trunc i32 %shr2 to i8
  store i8 %conv3, ptr %b, align 1
  %2 = load i32, ptr %x.addr, align 4
  %sub4 = sub i32 %2, 62
  %shr5 = lshr i32 %sub4, 8
  %conv6 = trunc i32 %shr5 to i8
  store i8 %conv6, ptr %c, align 1
  %3 = load i32, ptr %x.addr, align 4
  %xor = xor i32 %3, 62
  %not = xor i32 %xor, -1
  %add = add i32 %not, 1
  %shr7 = lshr i32 %add, 8
  %not8 = xor i32 %shr7, -1
  %conv9 = trunc i32 %not8 to i8
  store i8 %conv9, ptr %d, align 1
  %4 = load i32, ptr %x.addr, align 4
  %xor10 = xor i32 %4, 63
  %not11 = xor i32 %xor10, -1
  %add12 = add i32 %not11, 1
  %shr13 = lshr i32 %add12, 8
  %not14 = xor i32 %shr13, -1
  %conv15 = trunc i32 %not14 to i8
  store i8 %conv15, ptr %e, align 1
  %5 = load i8, ptr %a, align 1
  %conv16 = zext i8 %5 to i32
  %not17 = xor i32 %conv16, -1
  %conv18 = trunc i32 %not17 to i8
  store i8 %conv18, ptr %na, align 1
  %6 = load i8, ptr %b, align 1
  %conv19 = zext i8 %6 to i32
  %not20 = xor i32 %conv19, -1
  %conv21 = trunc i32 %not20 to i8
  store i8 %conv21, ptr %nb, align 1
  %7 = load i8, ptr %a, align 1
  %conv22 = zext i8 %7 to i32
  %8 = load i32, ptr %x.addr, align 4
  %add23 = add i32 %8, 65
  %conv24 = trunc i32 %add23 to i8
  %conv25 = zext i8 %conv24 to i32
  %and = and i32 %conv22, %conv25
  %9 = load i8, ptr %na, align 1
  %conv26 = zext i8 %9 to i32
  %10 = load i8, ptr %b, align 1
  %conv27 = zext i8 %10 to i32
  %and28 = and i32 %conv26, %conv27
  %11 = load i32, ptr %x.addr, align 4
  %add29 = add i32 %11, 71
  %conv30 = trunc i32 %add29 to i8
  %conv31 = zext i8 %conv30 to i32
  %and32 = and i32 %and28, %conv31
  %or = or i32 %and, %and32
  %12 = load i8, ptr %nb, align 1
  %conv33 = zext i8 %12 to i32
  %13 = load i8, ptr %c, align 1
  %conv34 = zext i8 %13 to i32
  %and35 = and i32 %conv33, %conv34
  %14 = load i32, ptr %x.addr, align 4
  %sub36 = sub i32 %14, 4
  %conv37 = trunc i32 %sub36 to i8
  %conv38 = zext i8 %conv37 to i32
  %and39 = and i32 %and35, %conv38
  %or40 = or i32 %or, %and39
  %15 = load i8, ptr %d, align 1
  %conv41 = zext i8 %15 to i32
  %and42 = and i32 %conv41, 43
  %or43 = or i32 %or40, %and42
  %16 = load i8, ptr %e, align 1
  %conv44 = zext i8 %16 to i32
  %and45 = and i32 %conv44, 47
  %or46 = or i32 %or43, %and45
  ret i32 %or46
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
