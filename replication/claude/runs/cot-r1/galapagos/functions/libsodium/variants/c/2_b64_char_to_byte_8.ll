; ModuleID = '/home/liolsen/galapagos-replication/functions/libsodium/variants/c/2_b64_char_to_byte_8.bc'
source_filename = "/home/liolsen/galapagos-replication/functions/libsodium/variants/c/2_b64_char_to_byte_8.c"
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
  %w = alloca i32, align 4
  %mU = alloca i32, align 4
  %mL = alloca i32, align 4
  %mD = alloca i32, align 4
  %mP = alloca i32, align 4
  %mS = alloca i32, align 4
  %mH = alloca i32, align 4
  %x = alloca i32, align 4
  store i32 %c, ptr %c.addr, align 4
  %0 = load i32, ptr %c.addr, align 4
  %and = and i32 %0, 65535
  store i32 %and, ptr %w, align 4
  %1 = load i32, ptr %w, align 4
  %sub = sub i32 %1, 65
  %2 = load i32, ptr %w, align 4
  %sub1 = sub i32 90, %2
  %or = or i32 %sub, %sub1
  %shr = lshr i32 %or, 31
  %sub2 = sub i32 %shr, 1
  store i32 %sub2, ptr %mU, align 4
  %3 = load i32, ptr %w, align 4
  %sub3 = sub i32 %3, 97
  %4 = load i32, ptr %w, align 4
  %sub4 = sub i32 122, %4
  %or5 = or i32 %sub3, %sub4
  %shr6 = lshr i32 %or5, 31
  %sub7 = sub i32 %shr6, 1
  store i32 %sub7, ptr %mL, align 4
  %5 = load i32, ptr %w, align 4
  %sub8 = sub i32 %5, 48
  %6 = load i32, ptr %w, align 4
  %sub9 = sub i32 57, %6
  %or10 = or i32 %sub8, %sub9
  %shr11 = lshr i32 %or10, 31
  %sub12 = sub i32 %shr11, 1
  store i32 %sub12, ptr %mD, align 4
  %7 = load i32, ptr %w, align 4
  %sub13 = sub i32 %7, 43
  %8 = load i32, ptr %w, align 4
  %sub14 = sub i32 43, %8
  %or15 = or i32 %sub13, %sub14
  %shr16 = lshr i32 %or15, 31
  %sub17 = sub i32 %shr16, 1
  store i32 %sub17, ptr %mP, align 4
  %9 = load i32, ptr %w, align 4
  %sub18 = sub i32 %9, 47
  %10 = load i32, ptr %w, align 4
  %sub19 = sub i32 47, %10
  %or20 = or i32 %sub18, %sub19
  %shr21 = lshr i32 %or20, 31
  %sub22 = sub i32 %shr21, 1
  store i32 %sub22, ptr %mS, align 4
  %11 = load i32, ptr %w, align 4
  %sub23 = sub i32 %11, 65280
  %shr24 = lshr i32 %sub23, 31
  %sub25 = sub i32 %shr24, 1
  store i32 %sub25, ptr %mH, align 4
  %12 = load i32, ptr %mU, align 4
  %13 = load i32, ptr %w, align 4
  %sub26 = sub i32 %13, 65
  %and27 = and i32 %12, %sub26
  %14 = load i32, ptr %mL, align 4
  %15 = load i32, ptr %w, align 4
  %sub28 = sub i32 %15, 71
  %and29 = and i32 %14, %sub28
  %or30 = or i32 %and27, %and29
  %16 = load i32, ptr %mD, align 4
  %17 = load i32, ptr %w, align 4
  %add = add i32 %17, 4
  %and31 = and i32 %16, %add
  %or32 = or i32 %or30, %and31
  %18 = load i32, ptr %mP, align 4
  %and33 = and i32 %18, 62
  %or34 = or i32 %or32, %and33
  %19 = load i32, ptr %mS, align 4
  %and35 = and i32 %19, 63
  %or36 = or i32 %or34, %and35
  %20 = load i32, ptr %mH, align 4
  %21 = load i32, ptr %w, align 4
  %cmp = icmp eq i32 %21, 65327
  %conv = zext i1 %cmp to i32
  %sub37 = sub i32 63, %conv
  %and38 = and i32 %20, %sub37
  %or39 = or i32 %or36, %and38
  store i32 %or39, ptr %x, align 4
  %22 = load i32, ptr %x, align 4
  %23 = load i32, ptr %mU, align 4
  %24 = load i32, ptr %mL, align 4
  %or40 = or i32 %23, %24
  %25 = load i32, ptr %mD, align 4
  %or41 = or i32 %or40, %25
  %26 = load i32, ptr %mP, align 4
  %or42 = or i32 %or41, %26
  %27 = load i32, ptr %mS, align 4
  %or43 = or i32 %or42, %27
  %28 = load i32, ptr %mH, align 4
  %or44 = or i32 %or43, %28
  %not = xor i32 %or44, -1
  %and45 = and i32 %not, 255
  %or46 = or i32 %22, %and45
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
